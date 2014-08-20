require 'rails_helper'

RSpec.describe Word, :type => :model do
  before do
    @word = Word.new(negativity: "abandon", rank: -2)
  end

  subject(:word) { @word }

  it { is_expected.to respond_to(:negativity) }
  it { is_expected.to respond_to(:rank) }

  it { is_expected.to be_valid }
end
