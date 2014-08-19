class Post < ActiveRecord::Base
  include PostsHelper
  belongs_to :author, class_name: "User"
  belongs_to :memorial
  has_many :comments, as: :commentable

  validates :text, presence: true
  
  before_save :set_approved_to_false, if: :bad_text?

  def set_approved_to_false
    self.approved = false
  end

  def bad_text?
    string_array = self.text.downcase.split(' ')
    @score = score(string_array)
    @score <= -5
  end

  def score(string_array)
    @filter_number = 0
    string_array.each do |word|
      obscenity = Word.find_by(negativity: word)
      if obscenity
        @filter_number += obscenity.rank
      end
    end
    @filter_number
  end  
end
