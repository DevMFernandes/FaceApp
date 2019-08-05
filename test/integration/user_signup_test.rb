require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "valid signup information with account activation" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_path, params: { user: { name: 'Michael', email: 'michael@example.com', password: 'password', password_confirmation: 'password' } }
    end
  end
end
