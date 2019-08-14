require 'test_helper'

class UserTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:michael)
  end

  test "user should not save without email" do
    user = User.new(name: "michael", password: "foobar", password_confirmation: "foobar")
    assert_not user.save
  end

  test "user should not save with duplicate email" do
    user = User.new(email: "michael@example.com", name: "michael", password: "foobar", password_confirmation: "foobar")
    assert_not user.save
  end

  test "user should not save with non-matching passwords" do
    user = User.new(email: "michdsfsdfdsael@example.com", name: "michael", password: "foobar2", password_confirmation: "foobar")
    assert_not user.save
  end

  test "password should have a minimum length" do
    user = User.new(email: "michdsfsdfdsael@example.com", name: "michael")
    user.password = user.password_confirmation = "a" * 5
    assert_not user.valid?
  end

  test "associated posts should be destroyed" do
    user = User.create(email: "michdsfsdfdsael@example.com", name: "michael", password: "foobar", password_confirmation: "foobar")
    user.posts.create!(body: "Lorem ipsum")
    assert_difference 'Post.count', -1 do
      user.destroy
    end
  end

end
