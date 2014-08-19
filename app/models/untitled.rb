class Post < ActiveRecord::Base
  state_machine initial: :published do
  state :published, value: 0
  state :flagged, value: 1
  state :deleted, value: 2

  event :flag do
    transition :published => :flagged
  end

  event :delete do
    transition :published => :deleted
  end

  event :approve do
    transition :flagged => :published
  end

  event :accident do
    transition :deleted => :published
  end




end