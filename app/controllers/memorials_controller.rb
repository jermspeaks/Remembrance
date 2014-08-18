include ApplicationHelper

class MemorialsController < ApplicationController

	def index
		@photo = Photo.new
		@photo_last = Photo.last
	end

  def index
    @photo = Photo.new
    @photo_last = Photo.last
  end

  def show
    current_user
    @memorial = Memorial.find(params[:id])
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
