require 'test_helper'

class AddFriendTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:marcos)
    sign_in @user
  end

  test "add friend" do
    assert @user.friendships.empty?
    
    assert_difference '@user.friendships.count', 1 do
      post friendships_path, params: { friendship: { recipient_id: 2, creator_id: @user.id, status: false} }
    end

  end

end
