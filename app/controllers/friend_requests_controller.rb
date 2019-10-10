class FriendRequestsController < ApplicationController
  def create
    @user = User.find(params[:id])
    current_user.request_friendship_with(@user)
    @user.notifications.create(message: "#{current_user.name} wants to be friends with you")
  end

  def destroy
    @friend_request = FriendRequest.find_by(requester_id: params[:id])
    @friend_request.destroy
    flash[:success] = "Request deleted successfully"
    redirect_back_or_to root_path
  end
end
