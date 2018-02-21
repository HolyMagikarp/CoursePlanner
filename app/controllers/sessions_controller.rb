class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      redirect_to planner_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Username or password is invalid'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
