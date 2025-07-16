# test/integration/tasks_flow_test.rb

require "test_helper"

class TasksFlowTest < ActionDispatch::IntegrationTest
  test "index should show 'Show' and 'delete' buttons with correct paths" do
    task = tasks(:one)

    get tasks_url
    assert_response :success

    assert_select "a[href='#{task_path(task)}']", text: "Show"

    assert_select "form[action='#{task_delete_path(task)}'][method='post']" do
      assert_select "input[name='_method'][value='delete']", 1
    end
  end
end
