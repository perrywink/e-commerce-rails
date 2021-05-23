require 'test_helper'

class CollectionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @collection = collections(:one)
  end

  test "should get index" do
    get collections_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:admin)
    get new_collection_url
    assert_response :success
  end

  test "should create collection" do
    sign_in users(:admin)
    assert_difference('Collection.count') do
      post collections_url, params: { collection: { name: "new collection" } }
    end

    assert_redirected_to collection_url(Collection.last)
  end

  test "should show collection" do
    get collection_url(@collection)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:admin)
    get edit_collection_url(@collection)
    assert_response :success
  end

  test "should update collection" do
    sign_in users(:admin)
    patch collection_url(@collection), params: { collection: { name: "changed name" } }
    assert_redirected_to collection_url(@collection)
  end

  test "should destroy collection" do
    sign_in users(:admin)
    assert_difference('Collection.count', -1) do
      delete collection_url(@collection)
    end

    assert_redirected_to collections_url
  end
end
