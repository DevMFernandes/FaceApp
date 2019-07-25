require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
 include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "users path okay" do
    get users_path
    assert_response :success
  end

  test "should redirect user page when not logged in" do
    get user_path(@user)
    assert_redirected_to new_user_session_url
    #hello
  end

  test "should get to user page when logged in" do
    sign_in @user
    get user_path(@user)
    assert_response :success
  end

end
