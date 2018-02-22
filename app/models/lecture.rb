class Lecture < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :course

  serialize :professor, Array

  def self.get_similar_lectures(course_id, lecture_code)
    result = OpenStruct.new(course_id: course_id,
                            lecture_code: lecture_code,
                            times: [])

    Lecture.where(course_id: course_id, lecture_code: lecture_code).each do |l|
      result.location = l.location
      result.professor = l.professor.join(', ')
      result.times.append "#{l.day[0..2]} "\
                      "#{l.start_time.strftime("%I:%M %p")} - "\
                      "#{l.end_time.strftime("%I:%M %p")}"
    end
    result
  end

  def self.format_lectures_string(lecture)
    "<u>#{lecture.location}</u> <em>#{lecture.professor}</em><br/>"\
    "#{lecture.times.join("<br/>")}".html_safe
  end
end

# == Schema Information
#
# Table name: lectures
#
#  id           :integer          not null, primary key
#  lecture_code :string(255)
#  location     :string(255)
#  professor    :string(255)
#  day          :string(255)
#  start_time   :time
#  end_time     :time
#  duration     :time
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  course_id    :integer
#
