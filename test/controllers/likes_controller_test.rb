require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @like = likes(:one)
    @user = users(:michael)
  end

  test "should destroy like" do
    sign_in @user
    assert_difference('Like.count', -1) do
      delete like_url(@like)
    end
  end
end
