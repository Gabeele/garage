class CreateTopicTable < ActiveRecord::Migration[8.1]
  def change
    create_table :topic_tables do |t|
      t.string "name", unique: true, limit: 20, format: { with: /\A[a-zA-Z\-]+\z/, message: "only allows letters or dashes" }
      t.string "description"
      t.timestamps

      add_reference :topic_tables, :user, null: false, foreign_key: true
    end
  end
end
