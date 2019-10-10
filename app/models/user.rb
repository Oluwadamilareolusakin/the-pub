# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :images
  has_many :active_friend_requests, class_name: "FriendRequest", foreign_key: "requester_id"
  has_many :passive_friend_requests, class_name: "FriendRequest", foreign_key: "requested_id"
  has_many :friendships
  has_many :friends, through: :friendships, source: :friend

  has_many :requesters, through: :passive_friend_requests, source: :requester
  has_many :requesteds, through: :active_friend_requests, source: :requested

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, :trackable
end
