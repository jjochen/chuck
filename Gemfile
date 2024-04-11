# frozen_string_literal: true

source 'https://rubygems.org'

gem 'fastlane'
gem 'cocoapods'
gem 'xcode-install'

ios_plugins_path = File.join(File.dirname(__FILE__), 'ios', 'fastlane', 'Pluginfile')
eval_gemfile(ios_plugins_path) if File.exist?(ios_plugins_path)

android_plugins_path = File.join(File.dirname(__FILE__), 'android', 'fastlane', 'Pluginfile')
eval_gemfile(android_plugins_path) if File.exist?(android_plugins_path)
