require 'test_helper'

class BuyerControllerTest < ActionController::TestCase
  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should get logon" do
    get :logon
    assert_response :success
  end

  test "should get catalog" do
    get :catalog
    assert_response :success
  end

  test "should get cart" do
    get :cart
    assert_response :success
  end

end
