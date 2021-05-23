require 'test_helper'

class ShoppingBagsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  test "should get show" do
    sign_in users(:alice)
    get shopping_bags_show_url
    assert_response :success
  end

end
