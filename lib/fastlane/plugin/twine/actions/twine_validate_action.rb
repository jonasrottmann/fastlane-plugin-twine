module Fastlane
  module Actions
    class TwineValidateAction < Action
      def self.run(params)
        Actions.verify_gem!('twine')
        Helper::TwineConfigParser.parse(params).map(&:source_path).uniq.each do |source_path|
          if !File.exist?(source_path)
            UI.user_error!("Source file #{source_path} not found")
          else
            cmd = Helper::TwineCommandHelper.validate_command(source_path, params[:pedantic])
            cmd.prepend('bundle exec ') if params[:use_bundle_exec] && shell_out_should_use_bundle_exec?
            Actions.sh(cmd, error_callback: lambda { |result|
              UI.build_failure!(result)
            })
          end
        end
      end

      def self.description
        'Validates all twine files mentioned in the config file'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :configuration_path,
                                       env_name: 'TWINE_CONFIGURATION_PATH',
                                       description: 'Location to json file with configuration information',
                                       is_string: true,
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :pedantic,
                                       env_name: 'TWINE_VALIDATE_PEDANTIC',
                                       description: 'Run the validation using twines `pedantic` flag',
                                       is_string: false,
                                       optional: true,
                                       default_value: false),
          FastlaneCore::ConfigItem.new(key: :use_bundle_exec,
                                       env_name: "TWINE_USE_BUNDLE_EXEC",
                                       description: "Use bundle exec when there is a Gemfile presented",
                                       is_string: false,
                                       default_value: true)
        ]
      end

      def self.authors
        ['Jonas Rottmann']
      end

      def self.is_supported?(_platform)
        true
      end

      def self.category
        :building
      end

      def self.action_name
        name.split('::').last.gsub('Action', '').fastlane_underscore
      end
    end
  end
end
