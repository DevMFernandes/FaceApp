require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:michael)
    @comment1 = comments(:one)
  end

  test "user can create a friendship" do
    # assert_difference 'Friendship.count', 1 do
    #   @comment1.likes.create(user_id: 1)
    # end
  end

  test "user id should be present" do
    # like = @comment1.likes.create(user_id: 1)
    # like.user_id = nil
    # assert_not like.valid?
  end

  test "user can destroy a friendship" do
    # like = @comment1.likes.create(user_id: 1)
    # assert_difference 'Friendship.count', -1 do
    #   like.destroy
    # end
  end

end
