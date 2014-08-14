# require 'rails_helper'

# RSpec.describe Memorial, :type => :model do
#   before do
#   	@user = User.new(name: "Jonathan", email: "jonyoungg@gmail.com", phone: "9083803287")
#   	@user2 = User.new(name: "Simon", email: "simon@gmail.com", phone: "123456789")
#   	@
#   	@memorial = Memorial.new(moderator_id: @user.id)
#   	@memorial.post << Post.new(author_id: @user2.id, memorial_id: @memorial.id, approved: true, text: "This is a test post")
#   	@memorial.photo << Photo.new(uploader_id: @user2.id, memorial_id: @memorial.id, approved: true, url: "www.google.com", caption: "This is a caption", profile: false)
#   	@memorial.comments << Comment.new(commentable_id: )
#   end
# end


# RSpec.describe Flight, :type => :model do
#   before do
#   	@time = Time.now
#   	@flight = Flight.new(departure_scheduled: @time, departure_actual: (@time + (2 *60 * 60)) ,arrival_scheduled: (@time + (2 *60 * 60)),  arrival_actual: (@time + (4 *60 * 60)))
#     @flight.airline = Airline.new
#     @flight.arrival_airport = Airport.new(name: 'Airport 1')
#     @flight.departure_airport = Airport.new(name: 'Airport 2')
#   end

#   subject(:flight) { @flight }

# 	it { is_expected.to respond_to(:airline) }
#   it { is_expected.to respond_to(:departure_scheduled) }
#   it { is_expected.to respond_to(:departure_actual) }
#   it { is_expected.to respond_to(:arrival_scheduled) }
#   it { is_expected.to respond_to(:arrival_actual) }
#   it { is_expected.to respond_to(:departure_airport) }
#   it { is_expected.to respond_to(:arrival_airport) }

#   it { is_expected.to be_valid }

#   describe "when airline is not present" do
#   	before {@flight.airline = nil}
#   	it { is_expected.to_not be_valid }
#   end

#   describe "when departure_scheduled is not present" do
#   	before {@flight.departure_scheduled = ''}
#   	it { is_expected.to_not be_valid }
#   end

#   describe "when departure_actual is not present" do
#   	before {@flight.departure_actual = ''}
#   	it { is_expected.to_not be_valid }

#   end

#   describe "when arrival_scheduled is not present" do
#   	before {@flight.arrival_scheduled = '' }
#   	it { is_expected.to_not be_valid }
#   end

#   describe "when arrival_actual is not present" do
#   	before {@flight.arrival_actual = ''}
#   	it { is_expected.to_not be_valid }

#   end

#   describe "when departure_airport is not present" do
#   	before {@flight.departure_airport = nil}
#   	it { is_expected.to_not be_valid }
#   end

#   describe "when arrival_airport is not present" do
#   	before {@flight.arrival_airport = nil}
#   	it { is_expected.to_not be_valid }
#   end

#   describe "departure airport cannot be the same as arrival airport" do
#     before do
#       airport = Airport.new
#       @flight.departure_airport = airport
#       @flight.arrival_airport  = airport
#     end
#     it { is_expected.to_not be_valid}
#   end

# end