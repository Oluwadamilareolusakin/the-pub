# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :notifyable, polymorphic: true
  belongs_to :receipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'

  scope :unread, -> { where(read_at: nil) }
end
