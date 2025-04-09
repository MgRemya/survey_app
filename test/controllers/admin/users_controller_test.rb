require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get upload_form" do
    get admin_users_upload_form_url
    assert_response :success
  end

  test "should get upload_csv" do
    get admin_users_upload_csv_url
    assert_response :success
  end
end
