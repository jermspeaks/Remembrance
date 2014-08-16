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
			expect(response.code).to eq("302")
		end
	end

	describe '#create' do
		before do
		  request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
		end

		it 'should create a new user' do
			expect(request.env['omniauth.auth']).to be_kind_of(Hash)
			request.env['omniauth.auth']['credentials']['expires_at'] = Time.now + 1.week
	    post :create
			expect(User.last.email_address).to eq("jeremy_rhvuhfx_wongwong@tfbnw.net")
		end
	end

	describe '#destroy' do
		it 'should log out a user' do
			user = User.create(name: "Frank", email_address: "frank@example.com")
			session[:user_id] = user.id
			expect(session[:user_id]).to_not be_nil
	    delete :destroy
			expect(session[:user_id]).to be_nil
		end
	end

end
