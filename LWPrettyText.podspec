#
# Be sure to run `pod lib lint LWPrettyText.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LWPrettyText'
  s.version          = '1.0.0'
  s.summary          = 'A short description of LWPrettyText.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://gitlab.com/ioslibraries1/lwprettytext.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'luowei' => 'luowei@wodedata.com' }
  s.source           = { :git => 'https://gitlab.com/ioslibraries1/lwprettytext.git' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LWPrettyText/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LWPrettyText' => ['LWPrettyText/Assets/*.png']
  # }

  s.public_header_files = 'LWPrettyText/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
