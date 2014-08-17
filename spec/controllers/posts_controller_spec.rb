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

	describe 'GET #edit' do
		it 'should render a form to edit the post' do
			post :edit, :memorial_id => @memorial.id, 
			expect(response).to be_success
			expect(response.code).to eq("200")
		end
	end

	describe 'PUT #update' do
		it 'should edit the post' do
			post :update, :memorial_id => @memorial.id, :post => { author: @user, memorial: @memorial, approved: true, text: "Sorry about loss" }
			expect(Post.last.text).to eq("Sorry about loss")
	end

	describe 'DELETE #destroy' do
		it "destroys the requested post" do
       post = Post.create! valid_attributes
        expect {
          delete :destroy, {:id => post.to_param}, valid_session
        }.to change(post, :count).by(-1)
    end

    it "redirects to the memorial page" do
      post = Post.create! valid_attributes
      delete :destroy, {:id => post_params}, valid_session
      response.should redirect_to(memorials_path(@memorial))
    end
	end

end