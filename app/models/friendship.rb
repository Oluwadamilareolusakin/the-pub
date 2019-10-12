class Friendship < ApplicationRecord
  belongs_to :user
  has_many :notifications, as: :notifyable, dependent: :destroy
  belongs_to :friend, class_name: "User"
end
