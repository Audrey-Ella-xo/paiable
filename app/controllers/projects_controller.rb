# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[edit update destroy]
  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    @project.groups << Group.find(params[:project][:group_ids])

    if @project.save
      flash.now[:info] = 'project Created'
      redirect_to projects_path
    else
      flash.now[:danger] = 'Project creation failed.'
      render 'new'
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      flash[:info] = 'project updated!'
      redirect_to projects_path
    else
      flash.now[:danger] = 'Project update failed.'
      redirect_to 'edit'
    end
  end

  def destroy
    @project.destroy
    flash.now[:info] = 'Project destroyed'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :worked_hours, :author_id, group_ids: [])
  end
end
