# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]
  before_action :authenticate_user!
  before_action :store_url
  before_action :suggestions, only: %i[timeline]
  def show
    @comment = Comment.new
  end

  def create
    if params[:post][:content].empty? && params[:post][:image].nil?
      flash[:notice] = 'Nice try! Type something before you Pub'
      redirect_back_or_to root_path
      return
    end

    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = 'Which came first? The pub or the post :)'
      redirect_back_or_to root_path
    else
      redirect_back_or_to root_path
    end
  end

  def timeline
    @posts = current_user.feed.includes(:user, :likes, :comments)
    @comment = Comment.new
    @requesteds = current_user.requesteds.select(:name, :id).first(4)
    @requesters = current_user.requesters.select(:name, :id).first(4)
    @friends = current_user.friends.select(:name, :id).first(4)
  end

  def destroy
    return unless @post
    @post.destroy
    flash[:success] = 'We hate to see your post go!'
    redirect_back_or_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
