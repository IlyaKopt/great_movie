class Favorite < Like
  belongs_to :movie, counter_cache: :favorited
  belongs_to :user, counter_cache: :favorited
end
