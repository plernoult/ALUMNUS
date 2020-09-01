# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating 25 fake woman profiles...'

User.destroy_all

photos_woman = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg","11.jpg","12.jpg","13.jpg","14.jpg","15.jpg","16.jpg","17.jpg","18.jpg","19.jpg","20.jpg","21.jpg","22.jpg","23.jpg","24.jpg","25.jpg"]

25.times do
  user = User.new(
    first_name:    Faker::Name.female_first_name,
    last_name:     Faker::Name.last_name,
    email:         Faker::Internet.email,
    password: "123456",
    last_seen_at: "2020-08-31 15:35:28",
    current_city:       ["Paris", "Lausanne", "Genève", "Londres", "Berlin", "Renens", "Lyon", "Zurich"].sample,
    batch_number:  rand(1..500),
    batch_date:    Faker::Date.between_except(from: '2014-09-23', to: '2020-08-28', excepted: '2015-01-24'),
    occupation:    Faker::Job.title,
    company_name:  Faker::Company.name,
    bio:           Faker::Quote.famous_last_words,
  )
  file =  File.open(File.join(Rails.root, "/app/assets/images/seed-f/#{photos_woman[0]}"))
  user.photo.attach(io: file, filename:"#{photos_woman[0]}", content_type: "image/jpeg")
 
  photos_woman.shift

  user.save!
end

puts 'Creating 25 fake man profiles...'

photos_man = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg","11.jpg","12.jpg","13.jpg","14.jpg","15.jpg","16.jpg","17.jpg","18.jpg","19.jpg","20.jpg","21.jpg","22.jpg","23.jpg","24.jpg","25.jpg"]

25.times do
  user = User.new(
    first_name:    Faker::Name.male_first_name,
    last_name:     Faker::Name.last_name,
    email:         Faker::Internet.email,
    password: "123456",
    last_seen_at: "2020-08-31 15:35:28",
    current_city:       ["Paris", "Lausanne", "Genève", "Londres", "Berlin", "Renens", "Lyon", "Zurich"].sample,
    batch_number:  rand(1..500),
    batch_date:    Faker::Date.between_except(from: '2014-09-23', to: '2020-08-28', excepted: '2015-01-24'),
    occupation:    Faker::Job.title,
    company_name:  Faker::Company.name,
    bio:           Faker::Quote.famous_last_words,
    # photo:         Faker::LoremPixel.image(is_gray: false, category: 'people')
  )
  file =  File.open(File.join(Rails.root, "/app/assets/images/seed-m/#{photos_man[0]}"))
  user.photo.attach(io: file, filename:"#{photos_man[0]}", content_type: "image/jpeg")
 
  photos_man.shift

  user.save!
end

puts 'Finished!'
