describe Fastlane::Actions::TwineCheckAction do
  describe 'Twine file check' do
    let (:path_to_empty_config) { './../spec/fixtures/empty_config.json' }

    it 'Run check on empty configuration' do
      Fastlane::FastFile.new.parse("lane :test do
        twine_check(configuration_path: '#{path_to_empty_config}')
      end").runner.execute(:test)
    end
  end
end
