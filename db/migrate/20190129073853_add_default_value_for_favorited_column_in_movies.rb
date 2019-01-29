class AddDefaultValueForFavoritedColumnInMovies < ActiveRecord::Migration[5.1]
  def change
    change_column :movies, :favorited, :integer,default: 0
  end
end
