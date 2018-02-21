class Credit < ApplicationRecord
  has_one :user
  has_one :course
end

# == Schema Information
#
# Table name: credits
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  course_id  :integer
#
