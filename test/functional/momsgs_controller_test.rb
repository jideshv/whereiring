require 'test_helper'

class MomsgsControllerTest < ActionController::TestCase
  setup do
    @momsg = momsgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:momsgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create momsg" do
    assert_difference('Momsg.count') do
      post :create, momsg: @momsg.attributes
    end

    assert_redirected_to momsg_path(assigns(:momsg))
  end

  test "should show momsg" do
    get :show, id: @momsg.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @momsg.to_param
    assert_response :success
  end

  test "should update momsg" do
    put :update, id: @momsg.to_param, momsg: @momsg.attributes
    assert_redirected_to momsg_path(assigns(:momsg))
  end

  test "should destroy momsg" do
    assert_difference('Momsg.count', -1) do
      delete :destroy, id: @momsg.to_param
    end

    assert_redirected_to momsgs_path
  end
end
