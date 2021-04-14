require 'test_helper'

class TodoesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todoes_index_url
    assert_response :success
  end

  test "should get show" do
    get todoes_show_url
    assert_response :success
  end

  test "should get new" do
    get todoes_new_url
    assert_response :success
  end

  test "should get create" do
    get todoes_create_url
    assert_response :success
  end

  test "should get task_create" do
    get todoes_task_create_url
    assert_response :success
  end

  test "should get task_check" do
    get todoes_task_check_url
    assert_response :success
  end

  test "should get destroy" do
    get todoes_destroy_url
    assert_response :success
  end

end
