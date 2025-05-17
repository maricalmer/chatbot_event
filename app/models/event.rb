class Event < ApplicationRecord
  has_neighbors :embedding
  after_create :set_embedding

  private

  def set_embedding
    client = OpenAI::Client.new
    response = client.embeddings(
      parameters: {
        model: 'text-embedding-3-small',
        input: "Event: #{title}. Description: #{description}. Start time: #{start_time}. End time: #{end_time}"
      }
    )
    embedding = response['data'][0]['embedding']
    update(embedding: embedding)
  end
end
