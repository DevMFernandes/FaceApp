require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @friendship = friendships(:one)
  end

  test "should get create" do
    get  post_comments_url(@friendship)
    assert_response :success
  end

  # test "should get destroy" do
  #   get post_comment_url
  #   assert_response :success
  # end

end
