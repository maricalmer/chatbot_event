class AddEmbeddingToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :embedding, :vector, limit: 1536
  end
end
