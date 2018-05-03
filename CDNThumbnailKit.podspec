Pod::Spec.new do |s|
  s.name = 'CDNThumbnailKit'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'Thumbnail Strategy for multi content delivery network'
  s.homepage = 'https://github.com/Artear/App_Library_IOS_CDNThumbnailKit'
  s.authors = { 'Jose Luis Sagredo Pedraza' => 'jsagredo.ing@gmail.com' }
  s.source = { :git => 'https://github.com/Artear/App_Library_IOS_CDNThumbnailKit.git', :tag => s.version }
  s.ios.deployment_target = '10.0'
  s.source_files = 'CDNThumbnailKit/Classes/**/*'

  s.dependency 'ReachabilitySwift'
end
