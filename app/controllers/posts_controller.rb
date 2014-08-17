include ApplicationHelper

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    current_user
    @memorial = Memorial.find(params[:memorial_id])
    if @current_user
      new_post = Post.create(post_params)
      new_post.update(author: @current_user, memorial: @memorial)
      redirect_to memorial_path(@memorial)
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:text)
    end

end
