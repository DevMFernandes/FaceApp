require 'test_helper'

class FriendshipDependenciesTest < ActionDispatch::IntegrationTest

  test "associated friendships should be destroyed" do
    user = User.create(id: 4, email: "michdsfsdfdsael@example.com", name: "michael", password: "foobar", password_confirmation: "foobar")
    user2 = User.create(id: 5, email: "fooo@example.com", name: "john doe", password: "foobar", password_confirmation: "foobar")
    Friendship.create!(creator_id: 4, recipient_id: 5, status: true)
    assert_difference 'Friendship.count', -1 do
      user.destroy
    end
  end
end
