class ReviewController < ApplicationController
  include ApplicationHelper

  def report
    @post = Post.find(params[:id])
    if bad_text?(@post.text)
      @post.impassable
    else
      @post.passable
    end
    message = "Your report has been sent to the moderator."
    respond_to do |format|
      format.json { render json: message.to_json }
    end
  end

  def reportphoto
    @photo = Photo.find(params[:id])
    if bad_text?(@photo.text)
      @photo.impassable
    else
      @photo.passable
    end
    message = "processed"
    respond_to do |format|
      format.html
      format.json { render json: message.to_json }
    end
  end

  def queue
    pass = Post.where(state: "1", memorial_id: params[:memorial_id])
    fail = Post.where(state: "2", memorial_id: params[:memorial_id])
    @posts = pass + fail
    respond_to do |format|
      if @posts.empty?
        format.json { render json: @posts.to_json }
      else
        @queue = []
        @posts.each do |post|
          @queue << { id: post.id, text: post.text, poster: post.author.name }
        end
        format.json { render json: @queue.to_json }
      end
    end
  end

  def green_light
    @post = Post.find(params[:id])
    @post.approval
    message = "post has been approved"
    respond_to do |format|
      format.json { render json: message.to_json }
    end
  end

  def red_light
    @post = Post.find(params[:id])
    @post.disapproval
    message = "post has been deleted"
    respond_to do |format|
      format.json { render json: message.to_json }
    end
  end

  def deleted_list
    @posts = Post.where(state: 4)
    respond_to do |format|
      format.json { render json: @posts.to_json }
    end
  end

  def callback
    @post = Post.find(params[:id])
    @post.reapproval
    message = "post has been reapproved"
    respond_to do |format|
      format.json { render json: message.to_json }
    end
  end

end
