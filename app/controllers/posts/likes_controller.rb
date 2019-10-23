# frozen_string_literal: true

class Posts::LikesController < LikesController
  before_action :set_likeable

  private

  def set_likeable
    @likeable = Post.find(params[:post_id])
  end

  def set_like
    @like = Like.find_by('likeable_id = ? AND user_id = ?', params[:post_id], params[:id])
  end
end
