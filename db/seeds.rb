# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456')
    user.save!
end


Doghome.destroy_all

5.times do
  doghome = Doghome.new(
    title: Faker::Name.name,
    description: Faker::Creature::Dog.sound,
    location: Faker::Address.city,
    price_per_day: Faker::Commerce.price,
    user_id: User.first.id)
    doghome.save!
end

# Faker::Internet.password
