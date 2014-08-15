class MemorialsController < ApplicationController
	include ApplicationHelper

	def new 
		
	end

	def create 

	end

	def index
		current_user
		@attended_memorials = @current_user.attended_memorials
		@created_memorials = @current_user.created_memorials 
	end

	def show
		@memorial = Memorial.find params[:id]
	end

end
