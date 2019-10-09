<<<<<<< HEAD
class Posts::CommentsController < CommentsController
  before_action :set_commentable

  private 
    def set_commentable
      @commentable = Post.find(params[:id])
    end
end
=======
# frozen_string_literal: true

class Posts::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Post.find(params[:post_id])
  end
end
>>>>>>> comments-and-likes
