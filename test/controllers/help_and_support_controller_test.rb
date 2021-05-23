require 'test_helper'

class HelpAndSupportControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get help_and_support_url
    assert_response :success
  end

end
