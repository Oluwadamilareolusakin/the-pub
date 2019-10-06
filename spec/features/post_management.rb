require 'rails_helper'

RSpec.describe 'Post Management', type: :feature do
  context 'with valid details' do
    it "should create a post" do
      @post = create(:post)
      expect(@post).to be_valid
    end
  end

  context 'with invalid no user' do
    it "should be invalid" do
      @post = create(:post)
      @post.user = nil
      expect(@post).not_to be_valid
    end
  end
end