# frozen_string_literal: true

class Posts::CommentsController < CommentsController
  before_action :set_commentable

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  private

  def set_commentable
    @commentable = Post.find(params[:post_id])
  end
end
