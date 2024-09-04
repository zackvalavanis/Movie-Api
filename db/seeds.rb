# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'ffaker'
10.times do 
  Movie.create( 
    name: FFaker::Movie.title, 
    year: rand(1900..2024),
    lead_actor: FFaker::Name.name,
    sales: rand(1000000..10000000)
  )
end

# movie = Movie.new(
#   name: 'Zoro',
#   year: 1997,
#   lead_actor: 'Antonio Banderas', 
#   sales: 5000000
# )
# movie.save
