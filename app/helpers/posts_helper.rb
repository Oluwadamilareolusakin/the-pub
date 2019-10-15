# frozen_string_literal: true

module PostsHelper
  def like_button(post)
    if likes?(post)
      link_to  fa_icon("heart"), post_like_path(post, id: current_user.id), method: :delete
    else
      link_to  fa_icon("heart-o"), post_likes_path(post), method: :post
    end
  end

  def likes?(post)
    post.likes.find_by(user_id: current_user.id)
  end

  def user_avatar(user)
    if user.avatar.attached?
      image_tag url_for(user.avatar), class: 'user-card-avatar'
    else
      image_tag "blank-user.jpg", class: 'user-card-avatar'
    end
  end


  def requesters(requesters)
    if requesters.any?
      requesters.each do |requester|
        requester.avatar
        link_to requester.name, profile_path(requester)
      end
    else
      content_tag(:div, class:'placeholder-request')
    end
  end
end
