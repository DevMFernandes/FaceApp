require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @f = friendships(:one)
    @user = users(:michael)
  end



  test "should destroy friendship" do
    sign_in @user
    assert_difference('Friendship.count', -1) do
      delete friendship_url(@f)
    end
  end

end
