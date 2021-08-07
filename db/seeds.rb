# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'active_support/core_ext/integer/time'
require "open-uri"

images = ["https://images.unsplash.com/photo-1581888227599-779811939961?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1567&q=80",
"https://images.unsplash.com/photo-1518717758536-85ae29035b6d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
"https://images.unsplash.com/photo-1494947665470-20322015e3a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80",
"https://images.unsplash.com/photo-1546975490-e8b92a360b24?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGRvZ3N8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1617712196812-55f51fe91f2f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTQ3fHxkb2dzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1536780250812-9c417ccad37d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZG9ncyUyMGFuZCUyMHBlb3BsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1539923790716-af5490e0753a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZG9ncyUyMGFuZCUyMHBlb3BsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1510613439354-64547973b449?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZG9nJTIwYW5kJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1508568230916-c2692a5d7b1d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZG9nJTIwYW5kJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1601758261049-55d060e1159a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8ZG9nJTIwYW5kJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
"https://images.unsplash.com/photo-1560967560-2a19f2ca05b2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGRvZyUyMGFuZCUyMHBlb3BsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"]

prices = [15.99,22.55,20.85,19.89, 21.99, 25.59,30.99,16.99]

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
    price_per_day: prices.sample,
    user_id: User.first.id)


    file = URI.open(images.sample)
    doghome.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

    doghome.save!

end


# Faker::Internet.password


Booking.destroy_all

5.times do
  booking = Booking.new(
    start_date: 23.days.from_now,
    end_date: 25.days.from_now,
    total_price: '21.98',
    user_id: User.first.id,
    doghome_id: Doghome.first.id)
    booking.save!
end


