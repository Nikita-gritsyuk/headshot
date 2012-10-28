require 'rails'

#if ::Rails.version < '3.1' || !::Rails.application.config.assets.enabled

module Headshot
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "This generator install the Headshot assets (JavaScript, Audio, and Flash application files)."
      source_root File.expand_path('../../../../../lib/assets', __FILE__)

      def copy_javascripts
        say_status('copying', 'Copying Javascripts ...')
        copy_file('javascripts/headshot.js', 'public/swfs')
        copy_file('javascripts/headshot_support.js', 'public/javascripts')
      end

      def copy_audio_files
        say_status('copying', 'Copying Audio files ...')
        copy_file('audio/shutter.mp3', 'public/audio')
      end

      def copy_flash_app_files
        say_status('copying', 'Copying Flash application files ...')
        copy_file('swfs/headshot.swf', 'public/swfs')
      end
    end
  end
end

# else
  # TODO: what do we do when app is asset-pipelined?
# end