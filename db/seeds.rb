# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Restaurant.destroy_all

10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::Number.number(digits: 10),
    category: %w(chinese italian japanese french belgian).sample
  )
  restaurant.save
  5.times do
    review = Review.new(rating: rand(0..5), content: Faker::Restaurant.review)
    review.restaurant = restaurant
    review.save
  end
end
puts 'created 10 restaurants'
puts 'created 5 reviews per restaurant'
