class Like < ApplicationRecord

  validates :movie_id, uniqueness: { scope: :user_id }
end
