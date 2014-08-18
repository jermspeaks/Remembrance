class GuestsController < ApplicationController
  def new
  	@guests = User.all
  	@guest = MemorialGuest.new
  end

  def create
  	redirect_to root_path
  end
end
