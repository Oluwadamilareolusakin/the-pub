# frozen_string_literal: true

module UsersHelper
  def friendship_button(user)
    if not_same_user(user) 
      if  current_user.friend_request_with?(@user) && !current_user.friends_with(@user) && !current_user.requester?(@user)
        link_to  "Accept Friend Request", friendships_path(id: @user), method: :post 
      elsif !current_user.friend_request_with?(@user) 
        link_to  "Send Friend Request", friend_requests_path(id: @user), method: :post 
      elsif !current_user.friends_with(@user) && current_user.requester?(@user)
        link_to  "Cancel Request", friend_request_path(id: @user), method: :delete 
      elsif current_user.friends_with(@user) 
        link_to  "Unfriend", friendship_path(id: @user), method: :delete 
      end 
    end 
  end
end
