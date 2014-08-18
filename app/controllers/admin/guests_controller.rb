class Admin::GuestsController < ApplicationController
  def new
  	@memorial = Memorial.find(params[:memorial_id])
  	@exclude_ids = @memorial.guests.map(&:id)
  	@users = User.where.not(id: @exclude_ids)
  	@enlist_guests = MemorialGuest.new
  end

  def create
  	guest_ids = params[:memorial_guest][:guest]
  	guest_ids.pop
  	memorial = Memorial.find(params[:memorial_id])
  	guest_ids.each do |guest_id|
  		guest = User.find(guest_id)
  		MemorialGuest.create(guest_id: guest.id, memorial_id: memorial.id)
  	end
  	redirect_to memorial_path(memorial)
  end

  def invite_new_with_email
    @memorial = Memorial.find(params[:memorial_id])
    @invite = InviteMailer.new
  end

  def invite_create_with_email
    emails = params[:emails].split(', ')
  end
end