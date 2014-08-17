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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to memorials_path
      else
        render 'edit'
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to memorials_path
  end

  private
    def post_params
      params.require(:post).permit(:text)
    end

end
