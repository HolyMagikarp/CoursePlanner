class User < ApplicationRecord
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :lectures
  has_and_belongs_to_many :programs
  has_many :credits



  def enroll_course(course, lecture_code)
    self.lectures << course.lectures.where(:lecture_code => lecture_code)
    self.save!
  end

  def drop_course(course)
    self.lectures = self.lectures - course.lectures
    self.save!
  end

  def add_credit(course)
    self.credits.create!(:course => course)
  end

  def remove_credit(course)
    self.credits.where(:course_id => course.id).each(&:destroy)
  end

end
