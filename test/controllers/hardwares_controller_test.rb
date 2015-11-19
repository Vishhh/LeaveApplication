require 'test_helper'

class HardwaresControllerTest < ActionController::TestCase
  test "should get model_no" do
    get :model_no
    assert_response :success
  end

  test "should get name" do
    get :name
    assert_response :success
  end

  test "should get purchase_date" do
    get :purchase_date
    assert_response :success
  end

  test "should get brand" do
    get :brand
    assert_response :success
  end

  test "should get description" do
    get :description
    assert_response :success
  end

  test "should get token" do
    get :token
    assert_response :success
  end

end
