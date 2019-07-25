require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest

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
  end

  # test "should redirect edit when logged in as wrong user" do
  #   log_in_as(@other_user)
  #   get edit_user_path(@user)
  #   assert flash.empty?
  #   assert_redirected_to root_url
  # end

  # test "should get show" do
  #   get user_show_url
  #   assert_response :success
  # end

  # test "should get index" do
  #   get user_index_url
  #   assert_response :success
  # end

end
