require 'test_helper'

class LoginAdminControllerTest < ActionController::TestCase
  test "should get login2" do
    get :login2
    assert_response :success
  end

  test "should get logout2" do
    get :logout2
    assert_response :success
  end

end
