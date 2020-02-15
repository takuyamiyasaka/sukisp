require 'test_helper'

class Admins::AnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_answers_new_url
    assert_response :success
  end

end
