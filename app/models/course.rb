class Course < ApplicationRecord
  has_many :lectures
  has_and_belongs_to_many :users
end

# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  course_code  :string(255)
#  name         :string(255)
#  breadth      :integer
#  credit_value :float(24)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
