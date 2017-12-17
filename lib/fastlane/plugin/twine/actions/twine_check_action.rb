module Fastlane
  module Actions
    class TwineCheckAction < Action
      def self.run(params)
        require 'diffy'
        Actions.verify_gem!('twine')
        Helper::TwineConfigParser.parse(params).each do |config|
          if !File.exist?(config.source_path)
            UI.user_error!("Source file " + config.source_path + " not found")
          else
            UI.message(config.description)
            cmd = Helper::TwineCommandHelper.generate_command(config.source_path, config.destination_path + '.tmp', config.twine_args)
            cmd.prepend('bundle exec ') if params[:use_bundle_exec] && shell_out_should_use_bundle_exec?
            Actions.sh(cmd, error_callback: lambda { |e|
              UI.user_error!('Error while generating localization file ' + config.destination_path)
            })
            files_are_the_same = FileUtils.compare_file(config.destination_path, config.destination_path + '.tmp')
            if params[:visualize_diff] && !files_are_the_same
              puts Diffy::Diff.new(config.destination_path, config.destination_path + '.tmp', source: 'files').to_s(:color)
            end
            File.delete(config.destination_path + '.tmp')
            UI.test_failure!("Files are different") unless files_are_the_same
          end
        end
      end

      def self.description
        'Checks your twine files against the localization files specified by your config file'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :configuration_path,
                                       env_name: 'TWINE_CONFIGURATION_PATH',
                                       description: 'Location to json file with configuration information',
                                       is_string: true,
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :visualize_diff,
                                       env_name: "TWINE_VISUALIZE_DIFF",
                                       description: "Display diff of the files in case of a failure",
                                       is_string: false,
                                       default_value: true),
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

      def self.action_name
        name.split('::').last.gsub('Action', '').fastlane_underscore
      end
    end
  end
end
