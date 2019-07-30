require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @post = posts(:one)
    @user = users(:michael)
  end

  test "should get create" do
    get  new_post_comment_url(@post)
    assert_response :success
  end

  # test "should get destroy" do
  #   get post_comment_url
  #   assert_response :success
  # end

end
