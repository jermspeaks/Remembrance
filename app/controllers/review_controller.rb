class ReviewController < ApplicationController

  def report
    @post = Post.find(params[:id])
    @post.flag
    if input == @post.delete
      @post.destroy
    elsif input == @post.delete
      @post.destroy
    else
    end
  end


  # def index
  #   if params[:category_id] 
  #     @posts = Category.find(params[:category_id]).posts 
  #   elsif 
  #     params[:author_id]
  #     @posts = Author.find(params[:author_id]).posts 
  #   else 
  #     @posts = Post.all 
  #   end 
  # end

end
