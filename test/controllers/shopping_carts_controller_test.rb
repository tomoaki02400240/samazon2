require 'test_helper'

class ShoppingCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get idex" do
    get shopping_carts_idex_url
    assert_response :success
  end

end
