require 'rails_helper'

RSpec.describe MemorialsController, :type => :controller do
	describe "GET #new" do
    it 'should render form for a new memorial' do
    	get :new
    	expect(response).to be_success
    	expect(response.code).to eq("200")
    end
  end

  describe 'POST #create' do

  end

  describe 'GET #index' do
  	it 'should render the page' do
  		get :index
  		expect(response).to be_success
  		expect(response.code).to eq("200")
  	end
  end

  describe 'GET #show' do

  end

  describe 'GET #created' do

  end

  describe 'GET #attended' do

  end
end
