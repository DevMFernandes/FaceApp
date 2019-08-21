require 'test_helper'

class CommentsDependenciesTest < ActionDispatch::IntegrationTest
  test "associated comments should be destroyed" do
    post = Post.create(body: "michael", user_id: 1)
    comment = post.comments.create!(body: "michael", user_id: 1)
    assert_difference 'Comment.count', -1 do
      post.destroy
    end
  end
end
