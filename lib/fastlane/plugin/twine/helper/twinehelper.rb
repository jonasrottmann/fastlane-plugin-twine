module Fastlane
  module Helper
    class TwineCommandHelper
      def self.generate_command(path_to_twine_file, destination_path, twine_args)
        cmd = []
        cmd << ['twine generate-localization-file']
        cmd << [path_to_twine_file]
        cmd << [destination_path]
        cmd << [twine_args]
        return cmd.join(' ')
      end

      def self.validate_command(path_to_twine_file, pedantic)
        cmd = []
        cmd << ['twine validate-twine-file']
        cmd << [path_to_twine_file]
        cmd << [' --pedantic'] if pedantic
        return cmd.join(' ')
      end
    end
  end
end
