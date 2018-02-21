class ProgramRequirement < ApplicationRecord
  belongs_to :program
  has_many :courses
end
