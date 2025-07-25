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

  test "should create task with default status of 'In progress'" do
    assert_difference("Task.count") do
      post tasks_url, params: {
        task: {
          title: "Another Task",
          description: "Another description",
          status: "In progress",
          due: Date.today + 3.days
        }
      }
    end

    assert_redirected_to tasks_path
  end

    test "should not create task with invalid params" do
    assert_no_difference("Task.count") do
      post tasks_url, params: {
        task: {
          title: "",
          description: "",
          status: nil,
          due: nil
        }
      }
    end

    assert_response :unprocessable_entity
    assert_select "form"
  end

  test "should delete task" do
    assert_difference("Task.count", -1) do
      delete task_delete_url(@task)
    end

    assert_redirected_to tasks_path
    follow_redirect!
    assert_match "Task deleted", response.body
  end

  test "should redirect using find action" do
    post find_task_url, params: { id: @task.id }
    assert_redirected_to task_path(@task)
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
    assert_select "h1", "Edit"
  end

  test "should update task with valid data" do
    patch task_url(@task), params: {
      task: {
        title: "Updated title",
        description: "Updated description",
        status: "In progress",
        due: Date.today + 5.days
      }
    }

    assert_redirected_to tasks_path
    follow_redirect!
    assert_match "Task was successfully updated", response.body

    @task.reload
    assert_equal "Updated title", @task.title
  end

  test "should not update task with invalid data" do
    patch task_url(@task), params: {
      task: {
        title: "",
        description: "Still here",
        status: "In progress",
        due: Date.today + 5.days
      }
    }

    assert_response :unprocessable_entity
    assert_select "div", /There were some problems with your submission/
    assert_select "li", /Title can't be blank/
  end
end
