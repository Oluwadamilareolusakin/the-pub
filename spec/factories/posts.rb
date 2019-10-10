# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user
    content { 'MyText' }
  end
end
