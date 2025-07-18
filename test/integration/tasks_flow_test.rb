# test/integration/tasks_flow_test.rb

require "test_helper"

class TasksFlowTest < ActionDispatch::IntegrationTest
  test "index should show delete button with correct path and attributes" do
    task = tasks(:one)

    get tasks_url
    assert_response :success

    # Assert the delete form is present
    assert_select "form[action='#{task_delete_path(task)}'][method='post']" do
      assert_select "input[name='_method'][value='delete']", 1
      assert_select "input[type='submit'],button" # Ensure there's a submit mechanism
    end
  end
end
