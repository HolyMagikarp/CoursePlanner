class User < ApplicationRecord
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :lectures
  has_and_belongs_to_many :programs
  has_many :credits

end

# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string(255)
#  password   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
