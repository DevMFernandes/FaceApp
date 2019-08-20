require 'test_helper'

class PostTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:michael)
    @post = @user.posts.build(body: "Lorem ipsum")
    @post2 = posts(:one)
  end

  test "user can create posts" do
    user = User.create(email: "michdsfsdfdsael@example.com", name: "michael", password: "foobar", password_confirmation: "foobar")
    assert_difference 'user.posts.count', 1 do
      user.posts.create!(body: "Lorem ipsum")
    end
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "destroying a post should count -1 to Posts" do
    assert_difference 'Post.count', -1 do
      @post2.destroy
    end
  end

  test "post should not save without body" do
    post = Post.new(user_id: 1)
    assert_not post.save
  end



end
