require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should log in" do
    dave = users(:one)

    post :create, :name => dave.name, :password => "secret"
    assert_redirected_to admin_url

    assert_equal dave.id, session[:user_id]
  end

  test "should fail log in" do
    dave = users(:one)

    post :create, :name => dave.name, :password => "dfadsfa"
    assert_redirected_to login_url
  end

  test "should log out" do
    delete :destroy
    assert_redirected_to store_url
  end

end
