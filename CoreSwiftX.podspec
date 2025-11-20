Pod::Spec.new do |s|
  s.name             = 'CoreSwiftX'
  s.version          = '1.0.2'
  s.summary          = 'Basic Swift and UIKit extensions and utilities'
  s.description      = <<-DESC
CoreSwiftX provides a set of Swift and UIKit extensions and utilities 
to simplify common tasks, improve code readability, and accelerate iOS development.
It includes UIKit helpers, protocol-oriented extensions, RxSwift utilities, and
compatibility wrappers for modern iOS SDKs.
  DESC

  s.homepage         = 'https://github.com/GeorgEvseyev/CoreSwiftX'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Georgy Evseyev' => 'your_email@example.com' }
  s.source           = { :git => 'https://github.com/GeorgEvseyev/CoreSwiftX.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_versions   = ['5.0', '5.5', '5.9']

  # Включаем все исходники из Classes (compat, swiftx, uikit)
  s.source_files = 'core-swiftx/Classes/**/*.{swift,h}'

  s.dependency 'TinyConstraints'
  s.dependency 'RxSwift'
end

