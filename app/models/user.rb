# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  has_one_attached :header

  # has_many
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_friend_requests, class_name: 'FriendRequest', foreign_key: 'requester_id'
  has_many :passive_friend_requests, class_name: 'FriendRequest', foreign_key: 'requested_id'
  has_many :friendships
  has_many :friends, through: :friendships, source: :friend
  has_many :requesters, through: :passive_friend_requests, source: :requester
  has_many :requesteds, through: :active_friend_requests, source: :requested
  has_many :notifications, dependent: :destroy
  has_many :received_notifications, through: :notifications, source: :receipient

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, :trackable, 
         omniauth_providers: %i[facebook github]

  # validationss
  validates :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.avatar = auth.info.image
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def become_friends_with(user)
    return if friends.include?(user)

    friends << user
  end

  def unfriend(user)
    return unless friends.include?(user)

    friends.delete(user)
  end

  def request_friendship_with(user)
    requesteds << user
  end

  def friend_request_with?(user)
    requesteds.include?(user) || requesters.include?(user)
  end

  def requester?(user)
    requesteds.include?(user)
  end

  def friends_with(user)
    friends.include?(user)
  end

  def remove_friend_request_with(user)
    if requesteds.include?(user)
      requesteds.delete(user)
    elsif requesters.include?(user)
      requesters.delete(user)
    end
  end

  def unlike(like)
    return if !likes.include?(likes)
    likes.delete(like)
  end

  def likes?(like)
    likes.include?(like)
  end
end
