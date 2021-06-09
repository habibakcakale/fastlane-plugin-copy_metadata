describe Fastlane::Actions::CopyMetadataAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The copy_metadata plugin is working!")

      Fastlane::Actions::CopyMetadataAction.run(nil)
    end
  end
end
