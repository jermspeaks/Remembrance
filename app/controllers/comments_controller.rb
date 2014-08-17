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

  private
    def comment_params
      params.require(:comment).permit(:commenter, :commentable, :text)
    end
end