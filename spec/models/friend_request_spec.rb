require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  context 'valid requester and valid requested' do
    it 'should be valid' do
      @request = create(:friend_request)
      expect(@request).to be_valid
    end
  end
end
