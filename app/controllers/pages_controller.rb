class PagesController < ApplicationController

  def planner
    set_courses
    @user = User.find_by_id(session[:user_id])
    @programs = @user.programs
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
    @courses = Course.for_display.search(params[:search]).paginate(page: params[:page],
                                                                   per_page: 50)
  end

  def enrolled_lectures
    ids = []
    @user = User.find_by_id(session[:user_id])
    @user.lectures.each do |l|
      ids << lecture_to_cells(l.start_time, l.end_time, l.day)
    end
    render :json => ids.flatten
  end

  private

  def lecture_to_cells(start_time, end_time, day)
    cells = []
    start_time = start_time.hour
    end_time = end_time.hour
    case day
    when 'MONDAY'
      col = 1
    when 'TUESDAY'
      col = 2
    when 'WEDNESDAY'
      col = 3
    when 'THURSDAY'
      col = 4
    when 'FRIDAY'
      col = 5
    end

    (start_time..end_time).map do |row|
      "cell-#{row}-#{col}"
    end
  end
end
