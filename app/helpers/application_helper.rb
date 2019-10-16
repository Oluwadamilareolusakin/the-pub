# frozen_string_literal: true

module ApplicationHelper
  def not_same_user(user)
    user != current_user
  end
end
