# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update]
  def index
    @tasks = Task.all.order(name: :asc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash.now[:info] = 'task Created'
      redirect_to @task
    else
      flash.now[:danger] = 'Task creation failed.'
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @task.update(task_params)
      flash[:info] = 'task updated!'
      redirect_to @task
    else
      flash.now[:danger] = 'Task update failed.'
      redirect_to 'edit'
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :user_id, :activity)
  end
end
