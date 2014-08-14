<<<<<<< HEAD
class Post < ActiveRecord::Base3
=======
class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :memorial
  has_many :comments, as: :commentable

  validates :text, presence: true
>>>>>>> 12a605440b270ac6737d398591e30fb9cbae86be
end
