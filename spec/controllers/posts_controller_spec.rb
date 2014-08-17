require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

	describe 'GET #new' do
		it 'should render a new form for posts' do
			get :new
			expect(response).to be_success
			expect(response.code).to eq("200")
		end
	end

	describe 'POST #create' do
		it 'should save a new post' do
			before do
				@user = User.create(name: "Frank", email_address: "frank@example.com", password: "123456", password_confirmation: "123456")
				@memorial = Memorial.create(moderator: @user, deceased_name: "Nanners", approved: true, text: "What a loss")
			end
			post :create, :post => { author: @user, memorial: @memorial }
			expect(response).to redirect_to(memorial_path(@memorial))
  		expect(Post.last.text).to eq("What a loss")
		end
	end

	describe 'GET #edit'

	describe 'PUT #update'

	describe 'DELETE #destroy'

end