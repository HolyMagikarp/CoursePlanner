class Program < ApplicationRecord


  def requirements
    "ProgramRequirements::#{self.name.camelize}".constantize.new
  end


end
