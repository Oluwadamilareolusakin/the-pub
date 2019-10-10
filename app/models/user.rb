# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  
  #has_many
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_friend_requests, class_name: "FriendRequest", foreign_key: "requester_id"
  has_many :passive_friend_requests, class_name: "FriendRequest", foreign_key: "requested_id"
  has_many :friendships
  has_many :friends, through: :friendships, source: :friend
  has_many :requesters, through: :passive_friend_requests, source: :requester
  has_many :requesteds, through: :active_friend_requests, source: :requested

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, :trackable, omniauth_providers: %i[facebook github]
  
  #validationss
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
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def become_friends_with(user)
    return if friends.include(user)
    friends << user
  end

  def unfriend(user)
    return if !friends.include(user)
    friends.delete(user)
  end
end
