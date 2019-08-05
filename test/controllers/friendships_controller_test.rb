require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:michael)
  end

  test "should get create" do
    get friendships_url
    assert_response :success
  end

  test "should get destroy" do
    get friendship_url
    assert_response :success
  end

end
