class Post < ActiveRecord::Base
  include PostsHelper
  belongs_to :author, class_name: "User"
  belongs_to :memorial
  has_many :comments, as: :commentable

  validates :text, presence: true
end
