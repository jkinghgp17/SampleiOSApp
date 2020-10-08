source 'https://github.com/CocoaPods/Specs.git'

using_bundler = defined? Bundler

unless using_bundler
    puts "\nPlease re-run using:".red
    puts "  bundle exec pod install\n\n"
    exit(1)
end

use_frameworks!

target 'Sample-App' do
    platform :ios, '13.0'

    pod 'Alamofire', '~> 5.2'
    pod 'Moya', '~> 14.0'
    
end

workspace 'Sample-App'
