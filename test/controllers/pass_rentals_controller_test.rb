require "test_helper"

class PassRentalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pass_rentals_index_url
    assert_response :success
  end

  test "should get show" do
    get pass_rentals_show_url
    assert_response :success
  end

  test "should get new" do
    get pass_rentals_new_url
    assert_response :success
  end

  test "should get create" do
    get pass_rentals_create_url
    assert_response :success
  end

  test "should get edit" do
    get pass_rentals_edit_url
    assert_response :success
  end

  test "should get update" do
    get pass_rentals_update_url
    assert_response :success
  end

  test "should get destroy" do
    get pass_rentals_destroy_url
    assert_response :success
  end
end
