class PagesController < ApplicationController
  def planner
    flash.now.alert = 'nothing'
  end

  def course_listing
    @courses = Course.for_display.order('course_code').paginate(page: params[:page],
                                                                per_page: 50)
  end

  def program_requirements
    @user = User.find_by_id(session[:user_id])
    @programs = @user.programs
  end

end
