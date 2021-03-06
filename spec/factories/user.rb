# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user, aliases: %i[requester requested] do
    email { Faker::Internet.unique.email }
    name { Faker::Name.unique.name }
    password { 'A6charpasswordforsure' }
    password_confirmation { 'A6charpasswordforsure' }
    confirmed_at { Date.today }

    factory :jim do
      name { Faker::Name.name }
      email { Faker::Internet.email }
    end

    factory :jack do
      name { Faker::Name.name }
      email { Faker::Internet.email }
    end
  end
end
