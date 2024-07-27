class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :edit, :update, :destroy, :task_completed]


  def index
    @tasks = Task.where(user: current_user)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.user = current_user



    if @task.save!
      redirect_to tasks_path, notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity

    end
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    if @task.update(tasks_params)
      redirect_to task_path(@task), notice: "Task was successfully updated."
    else
      render :edit
    end
  end


  def task_completed
    @task.completed = !@task.completed
    if @task.save
      redirect_to tasks_path, notice: "Task status updated successfully."
    else
      redirect_to task_path(@task), alert: "Unable to update task status."
    end
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_tasks
    @task = Task.find(params[:id])
  end



  def tasks_params
    params.require(:task).permit(:title, :details)
  end
end
