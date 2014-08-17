include ApplicationHelper

class MemorialsController < ApplicationController
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
	end

	def attended
		@current_user = current_user
		@attended_memorials = @current_user.attended_memorials
	end

end
