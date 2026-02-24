class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :likes
      t.integer :dislikes
      t.timestamps
    end

    add_reference :posts, :user
    add_reference :posts, :topic
  end
end
