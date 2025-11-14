Pod::Spec.new do |s|
  s.name             = 'CoreSwiftX'
  s.version          = '0.1.0'
  s.summary          = 'Core utilities for Swift projects'
  s.description      = <<-DESC
    A set of Swift helpers and core utilities shared across iOS projects.
  DESC
  s.homepage         = 'https://github.com/GeorgEvseyev/CoreSwiftX'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'GeorgEvseyev' => 'evseyevgeorg@gmail.com' }
  s.source           = { :git => 'https://github.com/GeorgEvseyev/CoreSwiftX.git', :tag => s.version }

  s.platform         = :ios, '10.0'
  s.swift_version    = '5.0'

  s.source_files     = 'Sources/CoreSwiftX/**/*.{swift}'
end
