# frozen_string_literal: true

class FriendRequestsController < ApplicationController
  before_action :suggestions, only: %i[requesters requesteds]

  def show
    @request = FriendRequest.find(params[:id])
    @user = User.find_by(id: @request.requester.id)
    redirect_to profile_path(@user)
  end

  def create
    @user = User.find(params[:id])
    current_user.request_friendship_with(@user)
    friend_request = FriendRequest.find_by(requested: @user)
    friend_request.notifications.create(receipient: @user, actor: current_user, action: 'sent a')

    redirect_back_or_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    current_user.remove_friend_request_with(@user)
    flash[:success] = 'Request cancelled successfully'
    redirect_back_or_to root_path
  end

  def requesters
    @requesters = current_user.requesters
  end

  def requesteds
    @requesteds = current_user.requesteds
  end
end
