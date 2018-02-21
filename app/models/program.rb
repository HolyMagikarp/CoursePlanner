class Program < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :program_requirements
end

# == Schema Information
#
# Table name: programs
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  program_requirement_id :integer
#
