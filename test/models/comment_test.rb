require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  
  setup do
    @post = posts(:one)
    @user = users(:michael)
    @comment1 = comments(:one)
    @comment2 = comments(:two)
    @comment3 = comments(:three)
    @comment4 = comments(:four)
  end
  
  test "user comment should count to user comments" do
    post = Post.create(id: 1, body: "somepost", user_id: 1)
    assert_difference '@user.comments.count', 1 do
      @user.comments.create!(body: "Lorem ipsum", post_id: 1)
    end
  end

  test "user id should be present" do
    assert_not @comment2.valid?
  end

  test "destroying a comment should count -1 to Comments" do
    assert_difference 'Comment.count', -1 do
      @comment1.destroy
    end
  end

  test "comment should not save without body" do
    assert_not @comment4.save
  end

  test "comment id should be present" do
    assert_not @comment3.valid?
  end

end
