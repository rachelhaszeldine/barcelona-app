# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
# sources
source 'https://github.com/CocoaPods/Specs.git'

# global config
platform :ios, '9.0'
use_frameworks!

# targets
target 'TableViewPractise2' do
  target 'TableViewPractise2UITests' do
    pod 'XCTest-Gherkin'
  end
end

# hooks

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
