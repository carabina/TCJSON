#
# Be sure to run `pod lib lint TCJSON.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TCJSON'
  s.version          = '0.1.0'
  s.summary          = 'Simple monadic library for JSON Codable.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TCJSON is a simple monadic library built on top of iOS 11's Codable protocol.
You just have to make your Codable models conform to TCJSONCodable (without implementing a single function) to get a bunch of utlity functions and initializers.
                       DESC

  s.homepage         = 'https://github.com/TizianoCoroneo/TCJSON'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'TizianoCoroneo' => 'tizianocoroneo@me.com' }
  s.source           = { :git => 'https://github.com/TizianoCoroneo/TCJSON.git', :tag => s.version.to_s }
  s.social_media_url = 'https://facebook.com/tizianocoroneo'

  s.ios.deployment_target = '11.0'

  s.source_files = 'TCJSON/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TCJSON' => ['TCJSON/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
