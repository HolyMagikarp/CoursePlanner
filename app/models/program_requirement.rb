class ProgramRequirement < ApplicationRecord
  belongs_to :program
  has_many :courses
end

# == Schema Information
#
# Table name: program_requirements
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
