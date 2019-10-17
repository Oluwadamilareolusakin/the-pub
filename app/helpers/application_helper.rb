# frozen_string_literal: true

module ApplicationHelper
  def not_same_user(user)
    user != current_user
  end

  def friendship_button(user)
    return unless not_same_user(user)
    if current_user.friend_request_with?(user) && !current_user.friends_with(user) && !current_user.requester?(user)
      link_to 'Accept Friend Request', friendships_path(id: user), method: :post, class: 'friendship-btn'
    end

    unless current_user.friend_request_with?(user)
      return link_to 'Friend+', friend_requests_path(id: user), method: :post, class: 'friendship-btn'
    end

    unless current_user.friends_with(user) && current_user.requester?(user) 
      return link_to 'Cancel Request', friend_request_path(id: user), method: :delete, class: 'cancel-friendship'
    end

    if current_user.friends_with(user)
      link_to 'Unfriend', friendship_path(id: user), method: :delete, class: 'cancel-friendship'
    end
  end
end
