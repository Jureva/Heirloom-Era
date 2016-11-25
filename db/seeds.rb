# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Customer.create!(name:  "Administrator",
             email: "admin@fake.com",
             password:              "pa55w0rd",
             password_confirmation: "pa55w0rd",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
             
Customer.create!(name:  "Customer",
             email: "customerone@fake.com",
             password:              "passwordone",
             password_confirmation: "passwordone",
             admin: false,
             activated: true,
             activated_at: Time.zone.now)
             
Idea.create!(customer_id: 13,
    title: "Grandma's blouse",
    description: "It's retro style shirt with vintage soul, a blast from the past, I wanna wear now.",
    created_at: Time.zone.now,
    updated_at: Time.zone.now)
    
Idea.create!(customer_id: 2,
    title: "Hipster jacket",
    description: "I just wanna new retro style jacket for Xmas, so got one from my grandpa's young days.",
    created_at: Time.zone.now,
    updated_at: Time.zone.now)
    
    Idea.create!(customer_id: 13,
    title:"Lambada skirt",
    description: "Most valuable memories from the dance floor with that skirt, I want my child to wear (after adjustment)..	",
    created_at: Time.zone.now,
    updated_at: Time.zone.now)
    
     Idea.create!(customer_id: 69,
    title:"Scarf from the past",
    description: "Don't even remember now if my or mom's granny owned it..With HE help will have it as a best part of my dress.",
    created_at: Time.zone.now,
    updated_at: Time.zone.now)
    
    Idea.create!(customer_id: 9,
    title:"Pinapple bag",
    description: "Always wanted to own something animal and nature friendly, ecologic, have material, now need to shape it up.",
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

Order.delete_all
 
Order.create!([
  {customer_id: 2, title: "Hipster jacket", price: 200},
  {customer_id: 9, title: "Pinapple bag", price: 110},
  {customer_id: 13, title: "Grandma's blouse", price: 69.95},
  {customer_id: 13, title: "Lambada skirt", price: 49.25},
  {customer_id: 69, title: "Scarf from the past", price: 15.95}
])