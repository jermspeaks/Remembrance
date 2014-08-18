require 'rails_helper'

RSpec.describe Admin::GuestsController, :type => :controller do
	before do
    @user = User.create(name: "Jon", email_address: "jon@example.com", password: "123456", password_confirmation: "123456")
    @memorial = Memorial.create(moderator: @user, deceased_name: "Father")

	end

	describe 'GET #new' do
    it 'should render the form page' do
      get :new, :memorial_id => @memorial.id
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  describe 'GET #invite_new_with_email' do
    it 'should render the email form page' do
      get :new, :memorial_id => @memorial.id
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  describe 'POST #create' do
    @attendee = User.create(name: "Fran", email_address: "fran@example.com", password: "123456", password_confirmation: "123456")
    post :create, :memorial_guest => { :guest => ["#{@attendee.id}", ""] }
    expect(@memorial.guests.last).to eq(@attendee)
  end
end