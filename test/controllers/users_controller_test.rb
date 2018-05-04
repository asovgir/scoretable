require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
	@user = users(:one)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should get profile" do
  	get profile_path(@user)
  	assert_response :success
  end

  test "should add victory" do
  	# to do
  end

  test "should add loss" do
  	# to do
  end

end
