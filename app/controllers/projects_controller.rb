# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  def index
    @projects = current_user.projects.with_grouping
  end

  def second_index
    @projects = current_user.projects.without_grouping
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    @project.groups << Group.find(params[:project][:group_ids]) if params[:project][:group_ids]
    @project.tasks << Task.find(params[:project][:task_ids]) if params[:project][:task_ids]

    if @project.save
      flash.now[:info] = 'project Created'
      if params[:project][:group_ids]
        redirect_to projects_path
      else
        redirect_to second_index_path
      end
    else
      flash.now[:danger] = 'Project creation failed.'
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    @project.groups << Group.find(params[:project][:group_ids]) if params[:project][:group_ids]
    @project.tasks << Task.find(params[:project][:task_ids]) if params[:project][:task_ids]

    if @project.update(project_params)
      flash[:info] = 'project updated!'
      if params[:project][:group_ids]
        redirect_to projects_path
      else
        redirect_to second_index_path
      end
    else
      flash.now[:danger] = 'Project update failed.'
      redirect_to 'edit'
    end
  end

  def destroy
    @project.destroy
    flash.now[:info] = 'Project destroyed'
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :worked_hours, :author_id, group_ids: [], task_ids: [])
  end
end
