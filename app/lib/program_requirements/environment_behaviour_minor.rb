module ProgramRequirements
  class EnvironmentBehaviourMinor < Base

    def course_requirements
      data = YAML.load(File.open("config/program_requirements/environment_behaviour_minor.yml").read).with_indifferent_access
      return data
    end
  end
end