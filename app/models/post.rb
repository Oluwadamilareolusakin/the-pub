# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }

  # belongs_to
  belongs_to :user

  # has_many
  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :image
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :notifications, as: :notifyable

  # validations
  validates :content, presence: true, unless: :image
  validates :image, presence: true, unless: :content
end
