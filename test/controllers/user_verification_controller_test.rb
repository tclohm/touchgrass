require "test_helper"

class UserVerificationControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_verification_show_url
    assert_response :success
  end

  test "should get update" do
    get user_verification_update_url
    assert_response :success
  end

  test "should get verify_phone" do
    get user_verification_verify_phone_url
    assert_response :success
  end

  test "should get upload_id" do
    get user_verification_upload_id_url
    assert_response :success
  end
end
