# frozen_string_literal: true

FactoryBot.define do
  factory :friend_request do
    association :requested, factory: :user
    association :requester, factory: :user
    status { 1 }
  end
end
