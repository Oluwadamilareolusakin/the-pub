# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_like, only: %i[destroy]

  def create
    return if @likeable.likes.find_by(user: current_user)

    @like = @likeable.likes.build
    @like.user = current_user
    @like.save
    flash[:success] = "You liked #{@likeable.user.name}'s #{@like.likeable_type.downcase}"
    redirect_back_or_to root_path
  end

  def destroy
    current_user.unlike(@like)
    redirect_back_or_to root_path
  end

  private

  def set_like
    @like = Like.where('likeable_id = ? AND user_id = ?', params[:post_id], params[:id])
  end
end
