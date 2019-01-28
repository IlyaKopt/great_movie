class AddColumnThumbnailIntoMovies < ActiveRecord::Migration[5.1]
  def up
    add_attachment :users, :thumbnail
  end

  def down
    remove_attachment :users, :thumbnail
  end
end
