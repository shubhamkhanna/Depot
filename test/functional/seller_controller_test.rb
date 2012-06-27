require 'test_helper'

class SellerControllerTest < ActionController::TestCase
  test "should get sign_up" do
    get :sign_up
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

end
