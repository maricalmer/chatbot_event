class ChatbotJob < ApplicationJob
  queue_as :default

  def perform(question)
    @question = question
    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: questions_formatted_for_openai
      }
    )
    new_content = chatgpt_response["choices"][0]["message"]["content"]

    question.update(ai_answer: new_content)
    Turbo::StreamsChannel.broadcast_update_to(
      "question_#{@question.id}",
      target: "question_#{@question.id}",
      partial: "questions/question", locals: { question: question })
  end

  private

  def client
    @client ||= OpenAI::Client.new
  end

  def questions_formatted_for_openai
    questions = @question.user.questions
    results = []
    system_text = "You are an assistant for the Web Summit website, the world's largest tech conference. If you don't know the answer, you can say 'I don't know'. If you don't have any events at the end of this message, say we don't have that.  Here are the events you should use to answer the user's questions: "
    nearest_events.each do |event|
      system_text += "** EVENT #{event.id}: title: #{event.title}, description: #{event.description}, start time: #{event.start_time}, end time: #{event.end_time} **"
    end
    results << { role: "system", content: system_text }
    questions.each do |question|
      results << { role: "user", content: question.user_question }
      results << { role: "assistant", content: question.ai_answer || "" }
    end
    return results
  end

  def nearest_events
    response = client.embeddings(
      parameters: {
        model: 'text-embedding-3-small',
        input: @question.user_question
      }
    )
    question_embedding = response['data'][0]['embedding']
    return Event.nearest_neighbors(
      :embedding, question_embedding,
      distance: "euclidean"
    ).first(3)
  end
end
