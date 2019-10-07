class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  validates :content, presence: true
  has_many :likes, as: :likeable
  has_one_attached :image
end
