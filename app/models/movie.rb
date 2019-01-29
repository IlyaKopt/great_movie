class Movie < ApplicationRecord
  has_attached_file :thumbnail, path: ':rails_root/public/system/:attachment/:id/:style/:filename',
                                url: '/system/:attachment/:id/:style/:filename'
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :thumbnail, matches: [/png\z/, /jpe?g\z/]
  validates_attachment_size :thumbnail, in: 0..1.megabytes

  GENRES = %w[Action Adventure Animation Biography Comedy Crime Documentary Drama Fantasy History Horror Musical
              Mystery Romance Sci-Fi Thriller War Western]

  validates :name, :genres, :year, presence: true

  validates :year, format: { with: /\A\d{4}\z/, message: 'Integer only. No sign allowed.' }
  validates :name, length: { minimum: 0, maximum: 80 }
  validates :director, length: { minimum: 0, maximum: 60 }
  validates :main_star, length: { minimum: 0, maximum: 60 }
  validates :description, length: { minimum: 0, maximum: 400 }

  serialize :genres, Array
end
