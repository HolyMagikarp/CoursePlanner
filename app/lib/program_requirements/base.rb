module ProgramRequirements
  class Base
    def course_requirements
      {}
    end

    def check_program_completion(user)
      course_requirements.each do |req, details|
        return false unless check_requirement_progress(user, req) == details[:credits]
      end
      return true
    end

    def check_requirement_progress(user, requirement)
      progress = 0
      taken_courses = Course.where(id: user.credits.map(&:course_id))
      puts taken_courses.map(&:course_code)
      course_requirements[requirement][:courses].each do |req|
        earned_credits = []
        req.each do |option|
          earned = 0

          option.each do |o|
            course = taken_courses.where("course_code LIKE '%#{o}%'").first
            earned += course.credit_value if course
          end
          earned_credits << earned
        end

        progress += earned_credits.max
      end

      return progress
    end

    def missing_required_courses(user, requirement)
      courses = []
      taken_courses = Course.where(id: user.credits.map(&:course_id)).map(&:id)
      course_requirements[requirement][:courses].each do |req|
        req.each do |option|
          option.each do |o|
            course = Course.where("course_code LIKE '%#{o}%'").first
            courses << course unless taken_courses.include?(course.id)
          end
        end
      end
      courses
    end

    def suggested_courses(user)
      courses = []
      course_requirements.each do |req, details|
        unless check_requirement_progress(user, req) == details[:credits]
          courses << missing_required_courses(user, req)
        end
      end
      return courses.flatten
    end

    def fetch_unique_course_codes(courses)
      results = []
      courses.each do |course|
        results << course.course_code.scan( /^\w{6}/).first.downcase
      end
      [results.uniq]
    end
  end

end