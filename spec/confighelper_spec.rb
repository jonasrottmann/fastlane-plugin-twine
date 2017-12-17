describe Fastlane::Helper::TwineConfigParser do
  describe 'Config parser' do
    let (:path_to_invalid_config) { './../spec/fixtures/invalid_config.json' }

    it 'Raise an error if config file is invalid' do
      expect do
        result = Fastlane::FastFile.new.parse("lane :test do
          twine_validate(configuration_path: '#{path_to_invalid_config}')
        end").runner.execute(:test)
      end.to raise_error("Config file is of wrong format")
    end
  end
end
