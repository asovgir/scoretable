require 'test_helper'

class RecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @record = records(:one)
  end

  test "should get records index" do
    get records_url
    assert_response :success
  end

  test "should get new" do
    get new_record_path
    assert_response :success
  end

  test "should show record" do
    get record_url(@record)
    assert_response :success
  end

  test "should get edit" do
    get edit_record_url(@record)
    assert_response :success
  end

  #test "should create record" do
    #assert_difference('Record.count') do
      #post new_record_url, params: { newrecord: { category_id: 3, 
        #losses: 0, user_id: 1, wins: 1, competitor_user_id: 2 } }
    #end
    #assert_redirected_to record_url(Record.last)
  #end

  test "should update record" do
    patch record_url(@record), params: { record: { category_id: @record.category_id, 
      losses: @record.losses, user_id: @record.user_id, wins: @record.wins, 
      competitor_user_id: @record.competitor_user_id } }
    assert_redirected_to record_url(@record)
  end

  test "should destroy record" do
    assert_difference('Record.count', -1) do
      delete record_url(@record)
    end

    assert_redirected_to records_url
  end
end
