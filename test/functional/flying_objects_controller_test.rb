require 'test_helper'

class FlyingObjectsControllerTest < ActionController::TestCase
  setup do
    @flying_object = flying_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flying_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flying_object" do
    assert_difference('FlyingObject.count') do
      post :create, :flying_object => @flying_object.attributes
    end

    assert_redirected_to flying_object_path(assigns(:flying_object))
  end

  test "should show flying_object" do
    get :show, :id => @flying_object.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @flying_object.to_param
    assert_response :success
  end

  test "should update flying_object" do
    put :update, :id => @flying_object.to_param, :flying_object => @flying_object.attributes
    assert_redirected_to flying_object_path(assigns(:flying_object))
  end

  test "should destroy flying_object" do
    assert_difference('FlyingObject.count', -1) do
      delete :destroy, :id => @flying_object.to_param
    end

    assert_redirected_to flying_objects_path
  end
end
