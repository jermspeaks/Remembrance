class Admin::MemorialsController < ApplicationController
  include ApplicationHelper
  def new
    @memorial = Memorial.new
    @photo = Photo.new
  end

  def create
    current_user
    @moderator = @current_user
    @memorial = Memorial.new(moderator_id: @moderator.id)
    @memorial.update_attributes(memorial_params)
    @memorial.service_location.gsub!(/\W/, '+')
    @memorial.save
    @photo = Photo.new
    respond_to do |format|
      if @memorial.save && @photo.save
        format.html do
          @photo.update(uploader: @user, memorial: @memorial)
          redirect_to memorial_path(@memorial), notice: 'Photo was successfully created.'
        end
        format.json { render :show, status: :created, location: @photo }
      elsif @memorial.save
        format.html do
          redirect_to memorial_path(@memorial), notice: 'Memorial was successfully created.'
        end
        format.json { render :show, status: :created, location: @memorial }
      else
        format.html { render :new, notice: 'Photo was not uploaded correctly.' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
    @memorial = Memorial.find params[:id]
  end

  def update
    @memorial = Memorial.find params[:id]
    if @memorial.update_attributes(memorial_params)
      redirect_to @memorial
    else
      redirect_to edit_admin_memorial_path
    end
  end

  def destroy
    @memorial = Memorial.find params[:id]
    @memorial.destroy
    redirect_to memorials_path
  end

  def spam
    @memorial = Memorial.find params[:memorial_id]
    @spam = Post.where(memorial: @memorial, approved: false)
    respond_to do |format|
      unless @spam.empty?
        format.json { render :json => @spam.to_json }
      else
        format.json { render :json => "no_posts".to_json }
      end
    end
  end

  private
  def memorial_params
    params.require(:memorial).permit(:deceased_name, :date_of_birth, :date_of_death, :obituary_description, :service_description, :service_location)
  end
  # def show
  # 	@memorial = Memorial.find(params[:id])
  # end


end
