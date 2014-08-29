require 'test_helper'

class FirendRelationshipsControllerTest < ActionController::TestCase
  setup do
    @firend_relationship = firend_relationships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:firend_relationships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create firend_relationship" do
    assert_difference('FirendRelationship.count') do
      post :create, firend_relationship: { firend: @firend_relationship.firend, user_id: @firend_relationship.user_id }
    end

    assert_redirected_to firend_relationship_path(assigns(:firend_relationship))
  end

  test "should show firend_relationship" do
    get :show, id: @firend_relationship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @firend_relationship
    assert_response :success
  end

  test "should update firend_relationship" do
    patch :update, id: @firend_relationship, firend_relationship: { firend: @firend_relationship.firend, user_id: @firend_relationship.user_id }
    assert_redirected_to firend_relationship_path(assigns(:firend_relationship))
  end

  test "should destroy firend_relationship" do
    assert_difference('FirendRelationship.count', -1) do
      delete :destroy, id: @firend_relationship
    end

    assert_redirected_to firend_relationships_path
  end
end
