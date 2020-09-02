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

bio = ["Writer. Problem solver. Zombie fanatic. Coffee scholar. Tv evangelist. Beer maven. Analyst.","Food advocate. Certified bacon aficionado. Incurable travel fanatic. Beer scholar. Introvert.","Coffee fanatic. Food expert. games specialist. Lifelong social media scholar.","Friend of animals everywhere. Pop culture evangelist. Social media practitioner. games fanatic. Future teen idol.","Bacon fanatic. Food advocate. Freelance games practitioner. Certified thinker. Problem solver. Explorer.","Future teen idol. Professional games fanatic. Hipster-friendly creator. Freelance communicator. Entrepreneur.","Tv nerd. Alumnus fanatic. Social media enthusiast. Organizer. Zombieaholic.","Professional travel fan. Typical coffee junkie. General social media lover. Entrepreneur. Bacon fanatic.","Proud bacon lover. Student. Zombie ninja. Amateur internetaholic. Subtly charming explorer. Incurable thinker.", "Certified web buff. Pop culture aficionado. Bacon advocate. Typical writer. Beer fan.","Friendly social media geek. Extreme beer evangelist. Avid bacon fanatic. Pop culture ninja. Freelance tvaholic. Alumnus fan.","Wannabe analyst. Zombie advocate. Typical travel fanatic. Evil music guru. Alumnus trailblazer.", "Introvert. Food fanatic. Travel practitioner. Passionate music specialist. Freelance beeraholic. Amateur gamer. Troublemaker.", "Alumnus trailblazer. Wannabe thinker. Food maven. Hardcore zombie junkie.", "Beer practitioner. Devoted pop culture scholar. Social media trailblazer. Coffee buff. Analyst.","Explorer. Pop culture lover. Subtly charming games scholar. Bacon expert. Zombie aficionado. Social media junkie. Travel practitioner.", "Web trailblazer. Devoted social media specialist. Explorer. Zombie scholar. Coffee buff. Evil communicator.", "Evil thinker. Incurable social media fanatic. Web scholar. Tv expert. Music junkie. Food nerd. Student. Internet fan. Communicator. Gamer. Devoted beer ninja.", "Internet expert. Beer fanatic. Pop culture nerd. Coffee buff. Incurable communicator. Organizer. Travel guru. Bacon fan. Alumnus aficionado.", "Beer geek. Unapologetic Alumnus enthusiast. Communicator. Bacon advocate. Social media junkie.", "Alumnus scholar. Total food advocate. Falls down a lot. Coffee maven. Internet fanatic. Zombie ninja. Social media aficionado.", "Alumnus expert. games trailblazer. Travel specialist. Tv buff. Amateur music guru.","Web enthusiast. Avid social media guru. Entrepreneur. Coffee specialist. Bacon maven.", "Wannabe food scholar. Pop culture geek. Hardcore zombie specialist. Creator. Tv guru.","Travel maven. Tv fanatic. Pop culture junkie. Internet scholar. Web expert. Coffee buff. Social media trailblazer."]

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
    bio:           bio.sample
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
    bio:           bio.sample
  )
  file =  File.open(File.join(Rails.root, "/app/assets/images/seed-m/#{photos_man[0]}"))
  user.photo.attach(io: file, filename:"#{photos_man[0]}", content_type: "image/jpeg")
 
  photos_man.shift

  user.save!
end

puts 'Finished!'
