class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :movie_id
      t.integer :user_id
      t.string :type

      t.timestamps
    end

    add_index :likes, :movie_id
    add_index :likes, :user_id
  end
end
