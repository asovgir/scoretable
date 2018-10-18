require 'test_helper'


class UsersControllerTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  setup do
  	@user = users(:one)
    @competitor_user = users(:two)
    @record = records(:one)
    @competitor_record = records(:two)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should get user profile" do
  	get profile_path(@user)
  	assert_response :success
  end

  test "should add victory to user and loss to opponent" do
    # to do
  end

  test "should add loss to user and win to opponent" do
  	# to do
  end

end
