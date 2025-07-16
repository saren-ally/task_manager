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
end
