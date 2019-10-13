# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]
  before_action :authenticate_user!
  before_action :store_url

  
  def show; end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = 'Which came first? The pub or the post :)'
      redirect_back_or_to root_path
    else
      redirect_back_or_to root_path
    end
  end
  
  def timeline
    @posts = Post.all
  end
  
  def destroy
    @post.destroy
    flash[:success] = 'We hate to see your post go!'
    redirect_back_or_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
