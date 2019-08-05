require 'test_helper'

class AddFriendTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:marcos)
    sign_in @user
  end

  test "add friend" do
    assert @user.pending_friendships.empty?
    post friendships_path, params: { friendship: { recipient_id: 2, creator_id: @user.id} }
    assert_not @user.pending_friendships.empty?
  end

end
