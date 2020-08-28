# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 20 fake profiles...'
20.times do
  user = User.new(
    first_name:    Faker::Name.first_name,
    last_name:     Faker::Name.last_name,
    email:         Faker::Internet.email,
    password: "123456",
    current_city:       ["Paris", "Lausanne", "Genève", "Londres", "Berlin", "Renens", "Lyon", "Zurich"].sample,
    batch_number:  rand(1..500),
    batch_date:    Faker::Date.between_except(from: '2014-09-23', to: '2020-08-28', excepted: '2015-01-24'),
    occupation:    Faker::Job.title,
    company_name:  Faker::Company.name,
    bio:           Faker::Quote.famous_last_words,
  )
  file = URI.open("https://res.cloudinary.com/dhd9herac/image/upload/v1598540438/ulxeds4tr0m4hkyzweacs5i7cbkj.jpg")
  user.photo.attach(io: file, filename:"picture.jpg", content_type: "image/jpeg")
  user.save!
end

puts 'Finished!'