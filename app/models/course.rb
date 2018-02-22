class Course < ApplicationRecord
  has_many :lectures
  has_and_belongs_to_many :users
  serialize :breadth, Array


  def self.get_time(seconds)
    Time.at(seconds).utc.strftime("%I:%M%p")
  end

  def self.pull_courses(limit=1, skip=0)
    # num_courses = 16367
    url = "https://cobalt.qas.im/api/1.0/courses?limit=#{limit}&skip=#{skip}&key=EBhgyQ5SmZ3hIRj530U66pUQWVRUXwuY"
    courses = HTTParty.get(url).to_a

    courses.each do |c|
      new_course = Course.create(course_code: c['code'], 
                             name: c['name'], 
                             breadth: c['breadths'],
                             level: c['level'].to_s,
                             campus: c['campus'],
                             term: c['term'],
                             description: c['description']
                            )
      new_course.course_code[-3] == 'Y' ? new_course.credit_value = 1.0 : new_course.credit_value = 0.5
      new_course.save!
      
      meeting_sections = c['meeting_sections']
      meeting_sections.each do |m|
        m['times'].each do |l|
          Lecture.create(lecture_code: m['code'],
                         professor: m['instructors'],
                         start_time: Course.get_time(l['start']),
                         end_time: Course.get_time(l['end']),
                         duration: l['duration'] / 3600,
                         day: l['day'],
                         location: l['location'],
                         course_id: new_course.id
                        )
        end
      end
    end

  end

  def self.search(query)
    if query.present?
      where('course_code LIKE ?', "%#{query}%")
    else
      Course.where(id: 0)
    end
  end

  def self.for_display
    self.joins(:lectures).
      where('term REGEXP ? AND breadth IS NOT NULL', '2018 Winter').distinct
  end

  def display_string
    "<em>#{name}</em> #{description}<br/>"\
    "Breadth: #{breadth.join(', ')}, Level: #{level}"
  end

end

# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  course_code  :string(255)
#  name         :string(255)
#  breadth      :string(255)
#  credit_value :float(24)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  level        :string(255)
#  campus       :string(255)
#  term         :string(255)
#  description  :text(65535)
#
