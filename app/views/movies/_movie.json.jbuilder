json.extract! movie, :id, :name, :genres, :year, :director, :main_star, :description, :favorited, :created_at, :updated_at
json.url movie_url(movie, format: :json)
