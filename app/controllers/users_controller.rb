# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @requesteds = @user.requesteds.first(4)
    @requesters = @user.requesters.first(4)
    @suggestions = User.all.shuffle[0..4]
    @posts = @user.posts
    @friends = @user.friends.first(4)
  end

  def friends; end

  def friend_requests; end

  def notifications; end

  private

  def set_user
    @user = current_user
  end
end
