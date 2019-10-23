# frozen_string_literal: true

class Like < ApplicationRecord
  has_many :notifications, as: :notifyable, dependent: :destroy
  belongs_to :user
  belongs_to :likeable, polymorphic: true
end
