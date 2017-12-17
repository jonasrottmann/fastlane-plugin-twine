describe Fastlane::Actions::TwineGenerateAction do
  describe 'Twine file generation' do
    let (:path_to_empty_config) { './../spec/fixtures/empty_config.json' }

    it 'Run generate on empty configuration' do
      Fastlane::FastFile.new.parse("lane :test do
        twine_generate(configuration_path: '#{path_to_empty_config}')
      end").runner.execute(:test)
    end
  end
end
