require 'test_helper'

class AvailibilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get availibilities_index_url
    assert_response :success
  end

  test "should get new" do
    get availibilities_new_url
    assert_response :success
  end

  test "should get create" do
    get availibilities_create_url
    assert_response :success
  end

  test "should get show" do
    get availibilities_show_url
    assert_response :success
  end

  test "should get edit" do
    get availibilities_edit_url
    assert_response :success
  end

  test "should get update" do
    get availibilities_update_url
    assert_response :success
  end

end
