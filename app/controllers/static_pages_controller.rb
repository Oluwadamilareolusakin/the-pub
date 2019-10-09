# frozen_string_literal: true

class StaticPagesController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def dashboard; end

  def friends; end

  def friend_requests; end

  def notifications; end

  def timeline
    @post = @user.posts.build
    @posts = Post.all
    @comment = Comment.new
  end

  private

  def set_user
    @user = current_user
  end
end
