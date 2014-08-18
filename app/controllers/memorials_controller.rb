include ApplicationHelper

class MemorialsController < ApplicationController
  def index
    current_user
    @attended_memorials = []
    MemorialGuest.all.each do |record|
      if @current_user.id == record.guest_id
        attended << Memorial.find(record.memorial_id)
      end
    end

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
    current_user
    @attended = []
    MemorialGuest.all.each do |record|
      if @current_user.id == record.guest_id
        @attended << Memorial.find(record.memorial_id)
      end
    end
  end

end
