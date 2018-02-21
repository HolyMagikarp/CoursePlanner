class Exclusions < RelatedCourses

end

# == Schema Information
#
# Table name: related_courses
#
#  id              :integer          not null, primary key
#  course_id       :integer
#  type            :string(255)      not null
#  related_courses :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
