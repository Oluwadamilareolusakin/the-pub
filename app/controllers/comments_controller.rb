class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @comment
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect
  end
end
