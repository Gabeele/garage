class CreateTopicsTable < ActiveRecord::Migration[8.1]
  def change
    create_table :topics do |t|
      t.string :name, limit: 20, null: false
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    add_index :topics, [:user_id, :name], unique: true
  end
end
