module Fastlane
  module Actions
    class TwineGenerateAction < Action
      def self.run(params)
        Actions.verify_gem!('twine')
        Helper::TwineConfigParser.parse(params).each do |config|
          UI.user_error!("Source file #{config.source_path} not found") unless File.exist?(config.source_path)
          UI.message(config.description)
          cmd = Helper::TwineCommandHelper.generate_command(config.source_path, config.destination_path, config.twine_args)
          cmd.prepend('bundle exec ') if params[:use_bundle_exec] && shell_out_should_use_bundle_exec?
          Actions.sh(cmd, error_callback: lambda { |e|
            UI.user_error!('Error while generating localization file ' + config.destination_path)
          })
        end
      end

      def self.description
        'Generates all localization files specified by the configuration file'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :configuration_path,
                                       env_name: 'TWINE_CONFIGURATION_PATH',
                                       description: 'Location to json file with configuration information',
                                       is_string: true,
                                       optional: false),
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
