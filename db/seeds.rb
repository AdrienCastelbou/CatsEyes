# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Item.delete_all
User.delete_all
Cart.delete_all
ItemCart.delete_all
20.times do 
  file = open("http://placekitten.com/200/#{rand(200..300)}")
  Item.create(title: Faker::Creature::Cat.name, description: Faker::Creature::Cat.breed, price: rand(1..50)).cat_image.attach(io: file, filename: 'some-image.jpg')
end

User.create(email: "admin@yopmail.com", name: "admin", password: "aadmin", admin: true)