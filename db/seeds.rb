# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Customer.create!(name:  "Administrator",
             email: "ejure@ymail.com",
             password:              "evelinute",
             password_confirmation: "evelinute",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
Idea.create!(title: "Grandma's blouse",
    description: "It's retro style shirt with vintage soul, a blast from the past, I wanna wear now.",
    created_at: Time.zone.now,
    updated_at: Time.zone.now)
    
Idea.create!(title: "Hipster jacket",
    description: "I just wanna new retro style jacket for Xmas, so got one from my grandpa's young days.",
    created_at: Time.zone.now,
    updated_at: Time.zone.now)
             
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  Customer.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end


customers = Customer.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  customers.each { |customer| customer.feedbacks.create!(content: content) }
end