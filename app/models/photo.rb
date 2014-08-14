class Photo < ActiveRecord::Base
	has_many :comments, as: :commentable
	belongs_to :uploader, class_name: User
	belongs_to :memorial
	
	validates :url, presence: true
	validates :caption, presence: true
end
