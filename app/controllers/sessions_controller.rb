class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user 
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Username not found' # Not quite right!
      render 'new'
    end
  end

  def destroy
  end
end
