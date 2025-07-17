
require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  test "deletes a task via Stimulus" do
  task = Task.create!(title: "Test Task", description: "Sample", status: "in_progress", due: Date.today + 1)

  visit tasks_path

  assert_text "Test Task"

  within "#task-#{task.id}" do
    accept_confirm do
      click_button "Delete"
    end
  end

  assert_no_selector "#task-#{task.id}"
  assert_selector "#flash", text: "Task deleted successfully.", wait: 2
end
end
