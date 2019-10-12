class FriendRequest < ApplicationRecord
  scope :pending, -> {where("status == ?", 0)}
  belongs_to :requester, class_name: 'User'
  belongs_to :requested, class_name: 'User'
  has_many :notifications, as: :notifyable, dependent: :destroy
end
