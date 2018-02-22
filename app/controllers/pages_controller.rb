class PagesController < ApplicationController

  def planner
    set_courses
  end

  def _course_listing
    @courses = Course.for_display.order('course_code').paginate(page: params[:page],
                                                                per_page: 50)
  end

  def program_requirements
    render "programs/program_requirements"
  end

  def set_courses
    @courses = Course.for_display.order('course_code').paginate(page: params[:page],
                                                                per_page: 50)
  end

end
