# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "creating movies"

url = "http://tmdb.lewagon.com/movie/top_rated"
raw = URI.open(url).read
serialized = JSON.parse(raw)

10.times do |index|
  movie = Movie.new(
    title: serialized["results"][index]["title"],
    overview: serialized["results"][index]["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{serialized['results'][index]['poster_path']}",
    rating: serialized["results"][index]["vote_average"]
  )
  movie.save!
  puts "Created #{serialized['results'][index]['title']}"
end

puts "completed"
