# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Generate test questions for a user
User.create!(email: "michael.gallagher.0802@gmail.com",
             password: "passwerd",
             password_confirmation: "passwerd",
             admin: true )

community = Community.create!(name: "Public")

#user = User.find(1)
#user.confirm


# Generate a bunch of additional users
20.times do |n|
  email = "example-#{n+1}@indrasnet.com"
  password = "password"
  User.create!(email: email,
             password: password,
             password_confirmation: password)
end



#Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.confirm }
  users.each { |user| user.questions.create!(content: content) }
end 




10.times do
  content = Faker::Lorem.sentence(word_count: 50)
  user.questions.create!(content: content,
                          community: community ) 

end

