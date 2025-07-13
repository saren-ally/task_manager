require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get all_task url" do
    get all_tasks_url
    assert_response :success
  end
end
