module Fastlane
  module Helper
    class TwineCommandHelper
      def self.generate_command(use_bundle_exec, path_to_twine_file, destination_path, twine_args)
        cmd = []
        cmd << ['bundle exec'] if use_bundle_exec
        cmd << ['twine generate-localization-file']
        cmd << [path_to_twine_file]
        cmd << [destination_path]
        cmd << [twine_args]
        return cmd.join(' ')
      end

      def self.validate_command(use_bundle_exec, path_to_twine_file, pedantic)
        cmd = []
        cmd << ['bundle exec'] if use_bundle_exec
        cmd << ['twine validate-twine-file']
        cmd << [path_to_twine_file]
        cmd << [' --pedantic'] if pedantic
        return cmd.join(' ')
      end
    end
  end
end
