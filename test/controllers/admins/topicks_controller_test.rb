require 'test_helper'

class Admins::TopicksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_topicks_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_topicks_show_url
    assert_response :success
  end

end
