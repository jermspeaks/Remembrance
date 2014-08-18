include ApplicationHelper

class MemorialsController < ApplicationController
  def index
    current_user
    attend = @current_user.attended_memorials
    created = @current_user.created_memorials
    @attended_memorials = attend + created
    @post = Post.where("memorial_id IN (?)", @attended_memorials.map(&:id)).order("created_at DESC").limit(5)
    binding.pry
    # find all posts in memorials, order by recent, limit 5
    # find all photos in memorials, order by recent, limit 5
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
