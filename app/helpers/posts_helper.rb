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
end
