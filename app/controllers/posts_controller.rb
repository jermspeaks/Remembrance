include PostsHelper

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  # def create
  #   current_user
  #   @post = Post.new
  #   @post.save
  #   @user = current_user
  #   @memorial = Memorial.find(params[:memorial_id])
  #   @new_post = @memorial.posts.create(author_id: current_user.id, text: params[:post][:text])
  #   # redirect_to memorial_path(@author)
  # end

  def create
    current_user
    if @current_user
      new_post = Post.create(post_params)
      new_post.update(author: @current_user)
      new_post.save
      redirect_to memorial_path(Post.find(new_post.id))
    else
      redirect_to root_path
    end
  end

  def show
    @post = Post.fi-bnd(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:text)
    end

end
