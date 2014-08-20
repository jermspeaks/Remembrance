class Photo < ActiveRecord::Base
  include ApplicationHelper
  has_many :comments, as: :commentable
  belongs_to :uploader, class_name: User
  belongs_to :memorial
  mount_uploader :url, PhotoUploader

  validates :caption, presence: true

  state_machine initial: :neutral do
    state :neutral, value: 0
    state :pass, value: 1
    state :fail, value: 2
    state :approved, value: 3
    state :disapproved, value: 4

    event :passable do
      transition :neutral => :pass
    end
    
    event :impassable do
      transition :neutral => :fail
    end

    event :approval do
      transition [:pass, :fail] => :approved
    end

    event :disapproval do
      transition [:pass, :fail] => :disapproved
    end

    event :reapproval do
      transition :disapproved => :approved
    end

    after_transition :neutral => :pass, :do => :post_passable
    after_transition :neutral => :fail, :do => :post_impassable
    after_transition [:pass, :fail] => :approved, :do => :post_approval
    after_transition [:pass, :fail] => :disapproved, :do => :post_disapproval
    after_transition :disapproved => :approved, :do => :post_approval
  end

  def post_passable
    self.update(status: 1)
  end

  def post_impassable
    self.update(status: 2)
  end

  def post_approval
    self.update(status: 3)
  end

  def post_disapproval
    self.update(status: 4)
  end
end
