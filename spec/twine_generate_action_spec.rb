describe Fastlane::Actions::TwineGenerateAction do
  describe 'Twine file generation' do
    let (:path_to_nonextistent_config) { '' }
    let (:path_to_empty_config) { './../spec/fixtures/empty_config.json' }

    it 'Raise an error if config file was not found' do
      expect do
        result = Fastlane::FastFile.new.parse("lane :test do
          twine_generate(configuration_path: '#{path_to_nonextistent_config}')
        end").runner.execute(:test)
      end.to raise_error("Config file  not found")
    end

    it 'Run generate on empty configuration' do
      Fastlane::FastFile.new.parse("lane :test do
        twine_generate(configuration_path: '#{path_to_empty_config}')
      end").runner.execute(:test)
    end
  end
end
