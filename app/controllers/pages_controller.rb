class PagesController < ApplicationController
  def planner
  end

  def program_requirements
    render "programs/program_requirements"
  end

end
