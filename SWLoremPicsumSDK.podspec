Pod::Spec.new do |s|
  s.name         = "SWLoremPicsumSDK"
  s.version      = "0.0.4"
  s.summary      = "Lorem Ipsum... but for photos. SDK in Swift for https://picsum.photos/"
  s.description  = <<-DESC
  This is simple SDK written in Swift and it allows to easy get photos from https://picsum.photos/
  DESC
  s.homepage     = "https://github.com/swojtyna/SWLoremPicsumSDK"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Sebastian Wojtyna" => "wojtyna.sebastian@gmail.com" }
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/swojtyna/SWLoremPicsumSDK.git", :tag => s.version }
  s.source_files  = "SWLoremPicsumSDK/SWLoremPicsumSDK/Sources/**/*"
  s.dependency "Moya", "~> 13.0"
  s.swift_version = "5.0"
end
