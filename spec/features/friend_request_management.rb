require 'rails_helper'

RSpec.describe 'Friend Requests', type: :feature do
  before :each do
    @jim = create(:jim)
    @jack = create(:jack)
  end

  context 'with valid users' do
    it "should request a friendship from the requested" do
      @jim.requesteds << @jack
      expect(@jim.active_friend_requests.first.requested).to eq(@jack)
      expect(@jack.passive_friend_requests.first.requester).to eq(@jim)
    end
  end
end