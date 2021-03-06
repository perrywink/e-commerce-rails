require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @item = items(:one)
    @item.images.attach(io: File.open(Rails.root.join('test', 'fixtures' , 'files', 'test-image.jpg')), 
                filename: 'test-image.jpg')
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:admin)
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    sign_in users(:admin)
    assert_difference('Item.count') do
      post items_url, params: { item: { name: @item.name, price: @item.price } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:admin)
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    sign_in users(:admin)
    patch item_url(@item), params: { item: { name: @item.name, price: @item.price } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    sign_in users(:admin)
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
