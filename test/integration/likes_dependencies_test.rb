require 'test_helper'

class LikesDependenciesTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "associated likes should be destroyed if post destroyed" do
    post = Post.create(body: "michael", user_id: 1)
    like = post.likes.create!( user_id: 1)
    assert_difference 'Like.count', -1 do
      like.destroy
    end
  end

  test "associated likes should be destroyed if comment destroyed" do
    post = Post.create(id: 1, body: "somepost", user_id: 1)
    comment = post.comments.create!(body: "michael", user_id: 1)
    like = comment.likes.create!( user_id: 1)
    assert_difference 'Like.count', -1 do
      like.destroy
    end
  end
end
