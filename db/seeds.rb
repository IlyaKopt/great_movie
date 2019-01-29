# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
for i in 1..10 do
  User.create(username: "username_#{i.to_s}")
end

Movie.destroy_all

for i in 1..10 do
  m = Movie.new(name: "movie_name #{i.to_s}", genres: ['Action', 'Adventure'], year: rand(1900..2019) )
  m.thumbnail = File.new(Rails.root.join('app/assets/images/ford.png'), 'r')
  if m.save
    users = User.order("RANDOM()").limit(5)
    users.each{|u| u.favorites.create(movie_id: m.id) }
  end
end

Admin.destroy_all
Admin.create(email: 'admin@movie.com', password: '123456', password_confirmation: '123456')