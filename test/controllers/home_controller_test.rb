require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items = items(:one)
    @item.images.attach(io: File.open(Rails.root.join('test', 'fixtures' , 'files', 'test-image.jpg')), 
                filename: 'test-image.jpg')
  end
  
  test "should get index" do
    get root_url
    assert_response :success
  end

end
