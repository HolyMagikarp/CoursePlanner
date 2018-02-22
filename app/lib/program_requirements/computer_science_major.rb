module ProgramRequirements
  class ComputerScienceMajor < Base

    def course_requirements
      data = YAML.load(File.open("config/program_requirements/computer_science_major.yml").read).with_indifferent_access
      data[:later_years][:courses] << fetch_unique_course_codes(Course.where("level >= 200").where("level <= 400").where("course_code LIKE 'csc%'"))
      return data
    end
  end
end