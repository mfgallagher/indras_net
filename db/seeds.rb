# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Generate test questions for a user
User.create!(email: "michael.gallagher.0802@gmail.com",
             password: "passwerd",
             password_confirmation: "passwerd",
             admin: true )

community = Community.create!(name: "Public")

user = User.find(1)
user.confirm

10.times do
  content = Faker::Lorem.sentence(word_count: 50)
  user.questions.create!(content: content,
                          community: community ) 

end

