# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  def index
    @groups = Group.all.order(name: :asc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      flash.now[:info] = 'group Created'
      redirect_to groups_path
    else
      flash.now[:danger] = 'Group creation failed.'
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @group.update(group_params)
      flash[:info] = 'group updated!'
      redirect_to groups_path
    else
      flash.now[:danger] = 'Group update failed.'
      redirect_to 'edit'
    end
  end

  def destroy
    @group.destroy
    flash.now[:info] = 'Group destroyed'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :user_id, :icon)
  end
end
