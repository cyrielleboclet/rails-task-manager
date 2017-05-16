class TasksController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def show
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

private

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:name, :details)
  end

  def set_params
    @task = Task.find(params["id"])
  end


end
