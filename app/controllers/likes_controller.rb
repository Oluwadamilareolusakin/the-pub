class LikesController < ApplicationController
  before_action :set_like, only: %i[ destroy ]

  def create
    @like = @likeable.likes.build
    @like.user = current_user
    @like.save
    flash[:success] = "You liked #{@likeable.user.name}'s #{@like.likeable_type.downcase}"
    redirect_back_or_to root_path
  end 

  def destroy
    @like.destroy
    redirect_back_or_to root_path
  end

  private 
    def set_like
      @like = Like.find(params[:id])
    end
end
