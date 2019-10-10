# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates :content, presence: true
  has_many :likes, as: :likeable, dependent: :destroy
end
