require 'test_helper'

class TopicksControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get topicks_top_url
    assert_response :success
  end

  test "should get index" do
    get topicks_index_url
    assert_response :success
  end

  test "should get show" do
    get topicks_show_url
    assert_response :success
  end

  test "should get edit" do
    get topicks_edit_url
    assert_response :success
  end

end
