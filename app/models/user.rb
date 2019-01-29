class User < ApplicationRecord

  has_many :favorites
  has_many :movies, through: :favorites

  validates :username, presence: true
  validates :username, uniqueness: true
end
