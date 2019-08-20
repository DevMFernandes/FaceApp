require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:michael)
  end

  test "should get home" do
    sign_in @user
    get root_url
    assert_response :success
  end

  test "should redirect to sign up/login" do
    get root_url
    assert_redirected_to new_user_session_url
  end


end
