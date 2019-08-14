require 'test_helper'

class LikeTest < ActiveSupport::TestCase

  setup do
    @post = posts(:one)
    @user = users(:michael)
    @comment1 = comments(:one)
  end


  test "user can like things" do
    assert_difference 'Like.count', 1 do
      @comment1.likes.create(user_id: 1)
    end
  end

  test "user id should be present" do
    like = @comment1.likes.create(user_id: 1)
    like.user_id = nil
    assert_not like.valid?
  end

  test "destroying a post should count -1 to Posts" do
    like = @comment1.likes.create(user_id: 1)
    assert_difference 'Like.count', -1 do
      like.destroy
    end
  end
end
