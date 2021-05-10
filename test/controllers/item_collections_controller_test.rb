require 'test_helper'

class ItemCollectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get item_collections_new_url
    assert_response :success
  end

  test "should get destroy" do
    get item_collections_destroy_url
    assert_response :success
  end

end
