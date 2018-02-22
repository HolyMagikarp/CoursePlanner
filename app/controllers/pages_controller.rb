class PagesController < ApplicationController

  def planner
    set_courses
    puts @courses.count
    @user = User.find_by_id(session[:user_id])
    @programs = @user.programs
    @lectures = @user.lectures
  end

  def _course_listing
    @courses = Course.for_display.order('course_code').paginate(page: params[:page],
                                                                per_page: 50)
  end

  def _programs
    @user = User.find_by_id(session[:user_id])
    @programs = @user.programs
  end

  def set_courses
    @courses = Course.for_display.order('course_code').paginate(page: params[:page],
                                                                per_page: 50)
  end


end
