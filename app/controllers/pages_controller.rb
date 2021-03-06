class PagesController < ApplicationController

  def planner
    set_courses
    @user = User.find_by_id(session[:user_id])
    @programs = @user.programs
  end

  def _programs
    @user = User.find_by_id(session[:user_id])
    @programs = @user.programs
  end

  def set_courses
    @courses = Course.for_display.search(params[:search]).paginate(page: params[:page],
                                                                   per_page: 100)
  end

  def enrolled_lectures
    result = []
    @user = User.find_by_id(session[:user_id])
    @user.lectures.each do |l|
      result << lecture_to_cells(l.start_time, l.end_time, l.day, l.course_id)
    end
    render :json => result.flatten
  end

  def add_lecture
    @user = User.find_by_id(session[:user_id])
    lecture_code = params[:lecture_code]
    course = Course.find(params[:course_id])

    if @user.courses.include?(course)
      @user.drop_course(course)
      @user.remove_credit(course)
    else
      @user.enroll_course(course, lecture_code)
      @user.add_credit(course)
    end

    puts @user.courses.map(&:course_code)

    render :js => "load_lectures_into_calendar()"
  end

  private

  def lecture_to_cells(start_time, end_time, day, course_id)
    cells = []
    course_code = Course.find(course_id).course_code
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
      {id: "cell-#{row}-#{col}", course: course_code}
    end
  end
end
