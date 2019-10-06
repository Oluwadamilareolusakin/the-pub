require 'rails_helper'

RSpec.describe 'User Management', type: :feature do

  context 'with valid user details' do
    it "should create a user" do
      @user = create(:user)
      expect(@user).to be_valid
    end
  end

  context "with invalid user details" do
    it "should not create a user" do
      @user = build(:user, password: '')
      expect(@user).not_to be_valid
    end
  end

end