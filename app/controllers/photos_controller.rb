class PhotosController < ApplicationController
	def create
		@user = User.find(session[:user_id])
		@photo = Photo.new(photo_params)
    @photo.uploader = @user
    binding.pry
    respond_to do |format|
      if @photo.save
        format.html { redirect_to memorials_path, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { redirect_to memorials_path, notice: 'Photo was not uploaded correctly.' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
	end

	private
		def photo_params
      params.require(:photo).permit(:memorial_id, :approved, :uploader, :url, :caption, :profile)
    end
end
