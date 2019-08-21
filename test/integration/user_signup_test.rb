require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "valid signup information with account activation" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_url, params: { user: { name: 'Michael', email: 'sadasdsa@example.com', password: 'password', password_confirmation: 'password' } }
    end
  end

end
