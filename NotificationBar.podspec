Pod::Spec.new do |s|
  s.name = 'NotificationBar'
  s.version = '0.1'
  s.license = 'MIT'
  s.summary = 'Notification bar for iOS apps'
  s.homepage = 'https://github.com/furqanmk/NotificationBar'
  s.social_media_url = 'http://twitter.com/furqanmk9'
  s.authors = { 'Furqan Khan' => 'furqanmk@outlook.com' }
  s.source = { :git => 'https://github.com/furqanmk/NotificationBar.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Source/*.swift'
end