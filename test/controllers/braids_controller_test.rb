require 'test_helper'

class BraidsControllerTest < ActionController::TestCase
  setup do
    @braid = braids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:braids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create braid" do
    assert_difference('Braid.count') do
      post :create, braid: { body: @braid.body, category_id: @braid.category_id, title: @braid.title, user_id: @braid.user_id }
    end

    assert_redirected_to braid_path(assigns(:braid))
  end

  test "should show braid" do
    get :show, id: @braid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @braid
    assert_response :success
  end

  test "should update braid" do
    patch :update, id: @braid, braid: { body: @braid.body, category_id: @braid.category_id, title: @braid.title, user_id: @braid.user_id }
    assert_redirected_to braid_path(assigns(:braid))
  end

  test "should destroy braid" do
    assert_difference('Braid.count', -1) do
      delete :destroy, id: @braid
    end

    assert_redirected_to braids_path
  end
end
