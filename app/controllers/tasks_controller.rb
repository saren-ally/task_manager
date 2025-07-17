class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def new
    # todo -paginate/eagerload
    # see README re scaling concerns
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

 def create
  @task = Task.new(task_params)

  if @task.save
    redirect_to tasks_path, notice: "Task was successfully created."
  else
    flash.now[:notice] = "Please fix the errors below." # Optional
    render :new, status: :unprocessable_entity
  end
end

  def delete
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.turbo_stream { head :no_content }
      format.html { redirect_to tasks_path, notice: "Task deleted." }
    end
  end

def find
  redirect_to task_path(params[:id])
end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :due)
  end
end
