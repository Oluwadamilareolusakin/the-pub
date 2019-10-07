require 'rails_helper'

RSpec.describe Friendship, type: :model do

  before :each do
    @jim = create(:jim)
  end
  
  context "with two valid users" do
    it "should create a valid friendship" do 
      @friendship = create(:friendship, friend: @jim)
      expect(@friendship).to be_valid
    end
  end
end
