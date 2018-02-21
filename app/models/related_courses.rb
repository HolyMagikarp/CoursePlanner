class RelatedCourses < ApplicationRecord
  belongs_to :course

  serialize :related_courses, Array
end
