require 'fastlane/action'
require_relative '../helper/copy_metadata_helper'

module Fastlane
  module SharedValues
    PUBLISH_METADATA = :PUBLISH_METADATA
  end

  module Actions
    class CopyMetadataAction < Action
      def self.run(params)
        if Dir.exist?(params[:metadata_dir])
          FileUtils.cp_r("#{params[:metadata_dir]}/.", 'fastlane')
          Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::PUBLISH_METADATA] = true
        end
      end

      def self.description
        "Copy IOS or Android Metadata to Build Folder"
      end

      def self.authors
        ["Habib Akcakale"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        ""
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :metadata_path,
                                       env_name: "METADATA_PATH",
                                       description: "Metadata path",
                                       optional: true,
                                       default_value: "../../Metadata/#{Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::PLATFORM_NAME]}",
                                       type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
