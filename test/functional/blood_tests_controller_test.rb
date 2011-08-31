require 'test_helper'

class BloodTestsControllerTest < ActionController::TestCase
  setup do
    @blood_test = blood_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blood_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blood_test" do
    assert_difference('BloodTest.count') do
      post :create, :blood_test => @blood_test.attributes
    end

    assert_redirected_to blood_test_path(assigns(:blood_test))
  end

  test "should show blood_test" do
    get :show, :id => @blood_test.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @blood_test.to_param
    assert_response :success
  end

  test "should update blood_test" do
    put :update, :id => @blood_test.to_param, :blood_test => @blood_test.attributes
    assert_redirected_to blood_test_path(assigns(:blood_test))
  end

  test "should destroy blood_test" do
    assert_difference('BloodTest.count', -1) do
      delete :destroy, :id => @blood_test.to_param
    end

    assert_redirected_to blood_tests_path
  end
end
