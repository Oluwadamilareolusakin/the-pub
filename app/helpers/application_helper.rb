# frozen_string_literal: true

module ApplicationHelper
  def not_same_user(user)
    user != current_user
  end

  def friendship_button(user)
    return unless not_same_user(user)

    if current_user.friend_request_with?(user) && !current_user.friends_with(user) && !current_user.requester?(user)
      return link_to 'Accept Request', friendships_path(id: user),method: :post, class: 'friendship-btn relationship-btn'
    end

    unless current_user.friend_request_with?(user)
      return link_to 'Friend+', friend_requests_path(id: user), method: :post, class: 'friendship-btn relationship-btn'
    end

    unless current_user.friends_with(user) && current_user.requester?(user)
      return link_to 'Cancel Request', friend_request_path(id: user), method: :delete, class: 'cancel-friendship relationship-btn'
    end

    return unless current_user.friends_with(user)

    return link_to 'Unfriend', friendship_path(id: user), method: :delete, class: 'cancel-friendship relationship-btn'
  end

  def logo_link
    link_to 'The Pub', root_path
  end
end
