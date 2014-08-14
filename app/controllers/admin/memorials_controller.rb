class Admin::MemorialsController < ApplicationController

	def new
		@memorial = Memorial.new
	end

	def create
	
	end

	def show

	end

	def edit
		@memorial = Memorial.find params[:id]
	end

	def update
	
	end

	def destroy
	
	end

end
