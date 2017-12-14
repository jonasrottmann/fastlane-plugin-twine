module Fastlane
  module Helper
    class TwineConfig
      attr_accessor :source_path, :twine_args, :destination_path
      def initialize(source_path, twine_args, destination_path)
        @source_path = source_path
        @twine_args = twine_args
        @destination_path = destination_path
      end
    end

    class TwineConfigParser
      def self.parse(params)
        require 'json'
        config_json = read_config_file(params)
        UI.user_error!("Config file " + params[:configuration_path] + " not found") if config_json.nil?
        UI.user_error!("Config file is of wrong format.") unless validate_config_schema(config_json)
        return JSON.parse(config_json).map { |c| TwineConfig.new(c['source_path'], c['twine_args'], c['destination_path']) }
      end

      def self.read_config_file(params)
        require 'fileutils'
        if File.exist?(params[:configuration_path])
          return File.read(params[:configuration_path])
        else
          return nil
        end
      end

      def self.validate_config_schema(json)
        require "json-schema"
        schema = {
          "type" => "object",
          "properties" => {
            "source_path" => {
              "type" => "string"
            },
            "twine_args" => {
              "type" => "string"
            },
            "destination_path" => {
              "type" => "string"
            }
          }
        }
        return JSON::Validator.validate(schema, json, list: true, strict: true)
      end
    end
  end
end
