class Memorial < ActiveRecord::Base
	belongs_to :moderator, class_name: User
	has_many :posts
	has_many :photos
	has_many :comments, as: :commentable
	has_many :guests, through: :memorial_guests
end