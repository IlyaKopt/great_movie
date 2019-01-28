class AddColumnThumbnailIntoMovies < ActiveRecord::Migration[5.1]
  def up
    add_attachment :movies, :thumbnail
  end

  def down
    remove_attachment :movies, :thumbnail
  end
end
