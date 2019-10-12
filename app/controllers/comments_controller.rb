# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]
  before_action :authenticate_user!
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = 'Eyy, nice comment!'
      @commentable.notifications.create(receipient: @user, actor: current_user, action: 'commented on')
      redirect_back_or_to root_path
    else
      flash[:notice] = 'Something seems to be wrong with your comment'
      redirect_back_or_to root_path
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Your comment was deleted'
    redirect_back_or_to root_path
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
