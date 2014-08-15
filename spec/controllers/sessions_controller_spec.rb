require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
	describe '#new' do
		it 'should render the homepage' do
			get :new
			expect(response).to be_success
			expect(response.code).to eq("200")
		end
		it 'should redirect to memorials path if user is session exists' do
			@user = User.create(name: "Frank", email_address: "frank@example.com")
			session[:user_id] = @user.id
			get :new
			expect(response).to be_redirect
			# expect(response.code).to eq("302")
		end
	end

	describe '#create' do
		before do
		  request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
		end
		it 'should create a new user' do
	 #    post :create, auth: env
		# 	expect(User.last.email_address).to eq("jeremy_rhvuhfx_wongwong@tfbnw.net")
		# end
	end
end
