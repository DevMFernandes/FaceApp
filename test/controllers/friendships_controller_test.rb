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

  test "should create friendship" do
    sign_in @user
    assert_difference('Friendship.count', 1) do
      post friendships_url, params: { friendship: { creator_id: 1, recipient_id: 3 } }
    end
  end

  test "should not create duplicate" do
    sign_in @user
    post friendships_url, params: { friendship: { creator_id: 3, recipient_id: 1 } }
    assert_redirected_to root_url
  end

  test "should not friend yourself" do
    sign_in @user
    post friendships_url, params: { friendship: { creator_id: 1, recipient_id: 1 } }
    assert_redirected_to root_url
  end

end
