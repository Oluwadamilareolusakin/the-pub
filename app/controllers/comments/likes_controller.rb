class Comments::LikesController < LikesController
  before_action :set_likeable
  
  private
    def set_likeable
      @likeable = Comment.find(params[:comment_id])
    end

    def set_like
      @like = Like.find_by('likeable_id = ? AND user_id = ?', params[:comment_id], params[:id])
    end
end