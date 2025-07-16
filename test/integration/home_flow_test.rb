require "test_helper"

class TasksFlowTest < ActionDispatch::IntegrationTest
  test "index should show heading and retrieve task message" do
    get root_url

    assert_response :success

    assert_select "h1", /Tasks|Task Manager/i
    assert_select "p", /Retrieve task by ID/i
  end
end
