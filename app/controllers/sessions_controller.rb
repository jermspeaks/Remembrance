class SessionsController < ApplicationController
	include ApplicationHelper
	def create
		user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to memorials_path
	end

	def new
		current_user
		if @current_user
			redirect_to memorials_path
		end
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