class MemorialsController < ApplicationController
	include ApplicationHelper

	def index
		current_user
		@attended_memorials = @current_user.attended_memorials
		@created_memorials = @current_user.created_memorials
	end

	def new
		@memorial = Memorial.new
  end

  def create
    @memorial = Memorial.new(memorial_params)
    if @memorial.save
      redirect_to @memorial
    else
      render 'newmemorial'
    end
  end

	def show
		@memorial = Memorial.find(params[:id])
	end


	def created

	end

	def attended

	end

	private
    def memorial_params
      params.require(:memorial).permit(:deceased_name, :date_of_birth, :date_of_death, :obituary_description, :service_description)
    end


end
