class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = allowed_params
    password_confirmation = user_params.delete(:password_confirmation)

    @user = User.new(user_params)
    if user_params[:password] == password_confirmation && @user.save
      session[:user_id] = @user.id
      redirect_to planner_path, notice: 'Thank you for signing up!'
    else
      render :new, notice: 'Error'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def allowed_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
