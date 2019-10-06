require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { 'A6charpasswordforsure' }
    password_confirmation { 'A6charpasswordforsure' }
    confirmed_at { Date.today }
  end
end