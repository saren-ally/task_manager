class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

 def create
  @task = Task.new(task_params)

  if @task.save
    redirect_to @task, notice: "Task was successfully created."
  else
    render :new, status: :unprocessable_entity
  end
end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "Task deleted"
  end

def find
  redirect_to task_path(params[:id])
end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :due)
  end
end
