#
# Be sure to run `pod lib lint XJHMultiProxyKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XJHMultiProxyKit'
  s.version          = '0.1.0'
  s.summary          = 'A thread-safe multi proxy.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A thread-safe multi proxy.@XJHMultiProxyKit'

  s.homepage         = 'https://github.com/cocoadogs/XJHMultiProxyKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cocoadogs' => 'cocoadogs@163.com' }
  s.source           = { :git => 'https://github.com/cocoadogs/XJHMultiProxyKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.public_header_files = 'XJHMultiProxyKit/XJHMultiProxyKit.h'
  s.source_files = 'XJHMultiProxyKit/XJHMultiProxyKit.h'
  
  s.subspec 'Proxy' do |ss|
    ss.public_header_files = 'XJHMultiProxyKit/XJHMultiProxy.h','XJHMultiProxyKit/NSObject+XJHMultiProxyAdditions.h'
    ss.source_files = 'XJHMultiProxyKit/XJHMultiProxy.{h,m}','XJHMultiProxyKit/NSObject+XJHMultiProxyAdditions.{h,m}'
  end
  
  # s.resource_bundles = {
  #   'XJHMultiProxyKit' => ['XJHMultiProxyKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
