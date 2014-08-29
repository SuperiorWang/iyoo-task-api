require 'test_helper'

class UserTaskIntermediatesControllerTest < ActionController::TestCase
  setup do
    @user_task_intermediate = user_task_intermediates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_task_intermediates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_task_intermediate" do
    assert_difference('UserTaskIntermediate.count') do
      post :create, user_task_intermediate: { description: @user_task_intermediate.description, is_done: @user_task_intermediate.is_done, number: @user_task_intermediate.number, task_id: @user_task_intermediate.task_id, user_id: @user_task_intermediate.user_id }
    end

    assert_redirected_to user_task_intermediate_path(assigns(:user_task_intermediate))
  end

  test "should show user_task_intermediate" do
    get :show, id: @user_task_intermediate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_task_intermediate
    assert_response :success
  end

  test "should update user_task_intermediate" do
    patch :update, id: @user_task_intermediate, user_task_intermediate: { description: @user_task_intermediate.description, is_done: @user_task_intermediate.is_done, number: @user_task_intermediate.number, task_id: @user_task_intermediate.task_id, user_id: @user_task_intermediate.user_id }
    assert_redirected_to user_task_intermediate_path(assigns(:user_task_intermediate))
  end

  test "should destroy user_task_intermediate" do
    assert_difference('UserTaskIntermediate.count', -1) do
      delete :destroy, id: @user_task_intermediate
    end

    assert_redirected_to user_task_intermediates_path
  end
end
