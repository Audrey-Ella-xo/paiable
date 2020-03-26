# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user
      log_in user
      redirect_to projects_path
    else
      flash.now[:danger] = 'Username not found'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
