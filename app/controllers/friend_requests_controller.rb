# frozen_string_literal: true

class FriendRequestsController < ApplicationController
  def create
    @user = User.find(params[:id])
    current_user.request_friendship_with(@user)
    friend_request = FriendRequest.find_by(requested: @user)
    friend_request.notifications.create(receipient: current_user, actor: current_user, action: 'sent a')

    redirect_back_or_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    current_user.remove_friend_request_with(@user)
    flash[:success] = 'Request deleted successfully'
    redirect_back_or_to root_path
  end
end
