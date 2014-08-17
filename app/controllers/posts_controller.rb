include ApplicationHelper

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    current_user
    @memorial = Memorial.find(params[:memorial_id])
    new_post = Post.new(post_params)
    if new_post.save
      new_post.update(author: @current_user, memorial: @memorial)
      redirect_to memorial_path(@memorial)
    else
      redirect_to memorials_path
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
