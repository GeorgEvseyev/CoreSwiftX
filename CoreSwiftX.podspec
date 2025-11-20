Pod::Spec.new do |s|
  s.name             = 'CoreSwiftX'
  s.version          = '1.0.0'
  s.summary          = 'Basic Swift and UIKit extensions and utilities'
  s.description      = <<-DESC
CoreSwiftX provides a set of Swift and UIKit extensions and utilities 
to simplify common tasks, improve code readability, and accelerate iOS development.
  DESC

  s.homepage         = 'https://github.com/GeorgEvseyev/CoreSwiftX'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Georgy Evseyev' => 'georgevseyev@gmail.com.com' }
  s.source           = { :git => 'https://github.com/GeorgEvseyev/CoreSwiftX.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_versions   = ['5.0', '5.5', '5.9']

  s.source_files = 'core-swiftx/Classes/**/*'

  s.dependency 'TinyConstraints'
  s.dependency 'RxSwift'
end
