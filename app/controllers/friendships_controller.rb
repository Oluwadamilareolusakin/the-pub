class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:id])
    @user.become_friends_with(current_user)
    current_user.become_friends_with(@user)
    flash[:success] = "You are now friends with #{@user.name}"
    @user.notifications.create(message: "#{current.user.name} accepted your friend request")
    redirect_back_or_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    @friendship_1 = Friendship.find_by(user_id: params[:id])
    @friendship_2 = Friendship.find_by(friend_id: params[:id])
    flash[:notice] = "You are no longer friends with "
    @user.unfriend(current_user)
    current_user.unfriend(@user)
    @friendship_1.destroy
    @friendship_2.destroy
  end
end
