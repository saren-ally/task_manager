require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get all_task url" do
    get tasks_url
    assert_response :success
  end

  test "should return all tasks in the database" do
    get tasks_url
    assert_response :success

    Task.all.each do |task|
      assert_match task.title, response.body
    end
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end
  test "should get new" do
    get new_task_url
    assert_response :success
  end
  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should create task with default status of 'in_progress'" do
    assert_difference("Task.count") do
      post tasks_url, params: {
        task: {
          title: "Another Task",
          description: "Another description",
          status: "in_progress",
          due: Date.today + 3.days
        }
      }
    end

    assert_redirected_to task_path(Task.last)
  end
end
