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
		@moderator = User.find_by(id: current_user)
		@created_memorials = @moderator.created_memorials
	end

	def attended
		@attended_memorials = @current_user.attended_memorials
	end

end
