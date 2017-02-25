require 'faker'


Question.delete_all

user = User.create(user_name: "test", email: "test@test.com", password: "test")
10.times do
  Question.create(question: Faker::Lorem.sentence(3, true), user_id: user.id)
end