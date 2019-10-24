require 'faker'
require 'factory_bot'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = User.create(name: "Tester tester", email: 'test@test.com', password: 'test123')
a.confirm
10.times do
  post = FactoryBot.create(:post)
  post.user = a
  post.save
end


50.times do 
  other_user = User.first
  user = FactoryBot.create(:user)
  10.times do
    post = FactoryBot.create(:post)
    post.user = user
    post.comments.create(content: "This is a comment", user: other_user)
    post.save
  end
  user.become_friends_with(other_user)
  other_user.become_friends_with(user)
end


5.times do
  other_user = User.last
  User.first.posts.each do |post|
    post.comments.create(content: "This is a comment", user: other_user)
  end
end

