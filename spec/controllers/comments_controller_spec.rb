require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  before do
    @user = User.create(name: "Frank", email_address: "frank@example.com", password: "123456", password_confirmation: "123456")
    @memorial = Memorial.create(moderator: @user, deceased_name: "Nanners")
    @post = Post.create(author: @user, memorial: @memorial, approved: true, text: "Sorry about loss")
  end

  describe 'GET #new' do
    it 'should render a new form for comments' do
      get :new, :memorial_id => @memorial.id
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  describe 'POST #create' do
    it 'should save a new comment' do
      comment :create, :post_id => @post.id, :comment { author: @user, post: @post, text: "Sample comment" }
      expect(response.code).to eq("302")
      expect(Comment.last.text).to eq("Sample comment")
    end
  end


end