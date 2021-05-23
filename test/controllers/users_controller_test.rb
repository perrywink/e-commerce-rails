require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get set_subscription" do
    get users_set_subscription_url
    assert_response :success
  end

end
