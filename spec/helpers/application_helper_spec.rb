require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe '#current_user' do
    it 'should return the current user if the current user holds a session' do
      @user = User.create(name: "Joe Blo", email_address: "me@example.com", password: "12345", password_confirmation: "12345")
      session[:user_id] = @user.id
      expect(current_user).to eq(@current_user)
    end
  end

  describe '#set_approved_to_false' do
    it 'should set the object approval to false' do
      post = Post.create(text: "This is a message.")
      set_approved_to_false(post)
      expect(post.approved).to eq(false)
    end
  end

  describe '#bad_text?' do
    it 'should be true if the words passed in are obscene' do
      text = "Negativity, and other fucked up shit"
      expect(bad_text?(text)).to eq(true)
    end

    it 'should be false if the words passed in are not obscene' do
      text = "happy happy text, oh joy"
      expect(bad_text?(text)).to eq(false)
    end
  end
end


