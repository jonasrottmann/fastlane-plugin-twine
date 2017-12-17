describe Fastlane::Actions::TwineValidateAction do
  describe 'Twine file validation' do
    let (:path_to_nonextistent_config) { '' }
    let (:path_to_empty_config) { './../spec/fixtures/empty_config.json' }
    let (:config_empty_source_path) { './../spec/fixtures/config_empty_source_path.json' }

    it 'Raise an error if config file was not found' do
      expect do
        result = Fastlane::FastFile.new.parse("lane :test do
          twine_validate(configuration_path: '#{path_to_nonextistent_config}')
        end").runner.execute(:test)
      end.to raise_error("Config file  not found")
    end

    it 'Raise an error if source file was not found' do
      expect do
        result = Fastlane::FastFile.new.parse("lane :test do
          twine_validate(configuration_path: '#{config_empty_source_path}')
        end").runner.execute(:test)
      end.to raise_error("Source file  not found")
    end

    it 'Run validation on empty configuration' do
      Fastlane::FastFile.new.parse("lane :test do
        twine_validate(configuration_path: '#{path_to_empty_config}')
      end").runner.execute(:test)
    end
  end
end
