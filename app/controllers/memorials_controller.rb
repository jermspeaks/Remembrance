include ApplicationHelper

class MemorialsController < ApplicationController

	def index
		@photo = Photo.new
		@photo_last = Photo.last
	end

  def index
    current_user
    attend = @current_user.attended_memorials
    created = @current_user.created_memorials
    @attended_memorials = attend + created
    if @attended_memorials
      @posts = Post.where("memorial_id IN (?)", @attended_memorials.map(&:id)).order("created_at DESC").limit(5)
      @photos = Photo.where("memorial_id IN (?)", @attended_memorials.map(&:id)).order("created_at DESC").limit(5)
    else
      @nothing = "You have nothing in your feed"
    end
  end

  def show
    current_user
    @memorial = Memorial.find(params[:id])
    @photo = Photo.find_by(memorial_id: @memorial.id, profile: true)
  end

	def created
		current_user
		@moderator = @current_user
		@created_memorials = @moderator.created_memorials
    respond_to do |format|
      format.html
      format.json { render json: @created_memorials.to_json}
    end
	end

  def attended
    current_user
    @attended = []
    MemorialGuest.all.each do |record|
      if @current_user.id == record.guest_id
        @attended << Memorial.find(record.memorial_id)
      end
    end
    respond_to do |format|
      format.html
      format.json { render json: @attended.to_json}
    end
  end
end