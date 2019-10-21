# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :suggestions, only: %i[index]

  def index
    @friends = current_user.friends
  end

  def create
    @user = User.find(params[:id])
    current_user.remove_friend_request_with(@user)
    @user.become_friends_with(current_user)
    current_user.become_friends_with(@user)
    friendship = Friendship.find_by(friend_id: params[:id])
    flash[:success] = "You are now friends with #{@user.name}"
    friendship.notifications.create(receipient: @user, actor: current_user, action: 'accepted')
    redirect_back_or_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    @friendship_1 = Friendship.find_by(user_id: params[:id])
    @friendship_2 = Friendship.find_by(friend_id: params[:id])
    flash[:notice] = "You are no longer friends with #{@user.name}"
    @user.unfriend(current_user)
    current_user.unfriend(@user)
    return unless @friendship_1
    @friendship_1.destroy
    return unless @friendship_2
    @friendship_2.destroy
    redirect_back_or_to root_path
  end
end
