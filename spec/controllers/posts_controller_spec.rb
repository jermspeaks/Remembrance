require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
	before do
		@user = User.create(name: "Frank", email_address: "frank@example.com", password: "123456", password_confirmation: "123456")
		@memorial = Memorial.create(moderator: @user, deceased_name: "Nanners")
	end

	describe 'GET #new' do
		it 'should render a new form for posts' do
			get :new, :memorial_id => @memorial.id
			expect(response).to be_success
			expect(response.code).to eq("200")
		end
	end

	describe 'POST #create' do
		it 'should save a new post' do
			post :create, :memorial_id => @memorial.id, :post => { author: @user, memorial: @memorial, approved: true, text: "What a loss" }
			expect(response.code).to eq("302")
  		expect(Post.last.text).to eq("What a loss")
		end
	end

	describe 'GET #edit'

	describe 'PUT #update'

	describe 'DELETE #destroy'

end