include ApplicationHelper

class MemorialsController < ApplicationController


	def new
		@memorial = Memorial.new
	end

  def create
    @memorial = Memorial.new(params[:memorial])
		@memorial.save
		redirect_to @memorial
  end

	def index
		current_user
		@attended_memorials = @current_user.attended_memorials
		@created_memorials = @current_user.created_memorials
	end

	def show
		@memorial = Memorial.find(params[:id])
	end


	def created

	end

	def attended

	end

end
