class AddProgramRequirementsToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_reference :programs, :program_requirement, foreign_key: true
  end
end
