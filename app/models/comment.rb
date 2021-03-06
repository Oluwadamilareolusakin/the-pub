# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  validates :content, presence: true
  has_many :notifications, as: :notifyable
  has_many :likes, as: :likeable
end
