require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do 
  name = Faker::Name.name
  email = Faker::Internet.email
  username = Faker::Name.name.split(' ').join('')
  @user = User.create(name: name, email: email, password: 'Apassword1')
  @user.confirm
end


a = User.create(name: "Tolulope Olusakin", email: 'oluwadamilareo@ate.com.ng', password: 'Dammiiee12')
a.confirm
10.times do
  a.posts.create(content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')
end


10.times do
  other_user = User.last
  User.first(50).each do |user|
    post = user.posts.create(content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')
    post.comments.create(content: "This is a comment", user: other_user)
  end
end

5.times do
  other_user = User.first
  User.last.posts.each do |post|
    post.comments.create(content: "This is a comment", user: other_user)
  end
end

