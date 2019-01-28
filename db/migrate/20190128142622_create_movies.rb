class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :genres
      t.string :year
      t.string :director
      t.string :main_star
      t.text :description
      t.integer :favorited

      t.timestamps
    end
  end
end
