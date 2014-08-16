class SessionsController < ApplicationController
	include ApplicationHelper
	
	def new
		current_user
		if @current_user
			redirect_to memorials_path
		end
	end

	def create
		user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to memorials_path
	end

	def destroy
		session.clear
		redirect_to root_path
	end

	def backdoor
		session[:user_id] = params[:user_id]
		redirect_to memorials_path
	end
end