class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.save # Will raise ActiveModel::ForbiddenAttributesError
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(params[:task])
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end

  def set_tasks
    @task = Task.find(params[:id])
  end
  private

  def tasks_params
    params.require(:task).permit(:title, :details)
  end
end
