class Lecture < ApplicationRecord
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
#
