class CommentsController < ApplicationController
  include ApplicationHelper

  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    current_user
    @post = Post.find(params[:post_id])
    @memorial = Memorial.find(params[:memorial_id])
    @comment = @post.comments.create(comment_params)
    @comment.update(commenter: @current_user)
    redirect_to memorial_path(@memorial)
  end

  def show
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      @memorial = Memorial.find(params[:memorial_id])
      redirect_to memorial_path(@memorial)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to memorial_path(@memorial)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :commentable, :text)
    end
end