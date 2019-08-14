require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:michael)
    @user2 = users(:archer)
    @comment1 = comments(:one)
    @friendship1 = friendships(:one)
    @friendship2 = friendships(:two)
  end

  test "user can create a friendship" do
    assert_difference 'Friendship.count', 1 do
      Friendship.create(creator_id: 1, recipient_id: 2)
    end
  end

  test "creator id should be present" do
    @friendship1.creator_id = nil
    assert_not @friendship1.valid?
  end

  test "recipient id should be present" do
    @friendship1.recipient_id = nil
    assert_not @friendship1.valid?
  end

  test "user can destroy a friendship" do
    assert_difference 'Friendship.count', -1 do
      @friendship2.destroy
    end
  end

  test "new friendship default status should be 'false'" do
    friendship = Friendship.create(recipient_id: 3, creator_id: 1)
    assert_equal false, friendship.status
  end

  test "creating an existing friendship should not be allowed" do
    friendship1 = Friendship.create(recipient_id: 1, creator_id: 2)
    friendship = Friendship.new(recipient_id: 2, creator_id: 1)
    assert_not friendship.save
  end

  test "friending yourself should not be allowed" do
    friendship = Friendship.new(recipient_id: 1, creator_id: 1)
    assert_not friendship.save
  end

end