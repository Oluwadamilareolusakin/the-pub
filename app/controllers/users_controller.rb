# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def friends; end

  def friend_requests; end

  def notifications; end

  private

  def set_user
    @user = current_user
  end
end
