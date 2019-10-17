# frozen_string_literal: true

module ApplicationHelper
  def not_same_user(user)
    user != current_user
  end

  def friendship_button(user)
    return unless not_same_user(user)
    if current_user.friend_request_with?(user) && !current_user.friends_with(user) && !current_user.requester?(user)
      link_to 'Accept Friend Request', friendships_path(id: user), method: :post, class: 'friendship-btn'

    elsif !current_user.friend_request_with?(user)
      link_to 'Friend+', friend_requests_path(id: user), method: :post, class: 'friendship-btn'

    elsif !current_user.friends_with(user) && current_user.requester?(user)
      link_to 'Cancel Request', friend_request_path(id: user), method: :delete, class: 'cancel-friendship'
    elsif current_user.friends_with(user)
      link_to 'Unfriend', friendship_path(id: user), method: :delete, class: 'cancel-friendship'
    end
  end

  def pending_notifications
    @notifications = Notification.where(receipient: current_user).unread
    return if @notifications.any?
    "No pending notifications"
  end
end
