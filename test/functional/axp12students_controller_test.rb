require 'test_helper'

class Axp12studentsControllerTest < ActionController::TestCase
  setup do
    @axp12student = axp12students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:axp12students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create axp12student" do
    assert_difference('Axp12student.count') do
      post :create, axp12student: @axp12student.attributes
    end

    assert_redirected_to axp12student_path(assigns(:axp12student))
  end

  test "should show axp12student" do
    get :show, id: @axp12student.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @axp12student.to_param
    assert_response :success
  end

  test "should update axp12student" do
    put :update, id: @axp12student.to_param, axp12student: @axp12student.attributes
    assert_redirected_to axp12student_path(assigns(:axp12student))
  end

  test "should destroy axp12student" do
    assert_difference('Axp12student.count', -1) do
      delete :destroy, id: @axp12student.to_param
    end

    assert_redirected_to axp12students_path
  end
end
