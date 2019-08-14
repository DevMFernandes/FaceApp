require 'test_helper'

class PostsDependenciesTest < ActionDispatch::IntegrationTest
  test "associated posts should be destroyed" do
    user = User.create(email: "michdsfsdfdsael@example.com", name: "michael", password: "foobar", password_confirmation: "foobar")
    user.posts.create!(body: "Lorem ipsum")
    assert_difference 'Post.count', -1 do
      user.destroy
    end
  end
end
