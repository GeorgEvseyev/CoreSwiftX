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

  # ✅ путь к исходникам
  # если структура: Sources/CoreSwiftX/*.swift
  s.source_files     = 'Sources/CoreSwiftX/**/*.swift'

  # если у тебя файлы лежат просто в Sources/, то замени на:
  # s.source_files   = 'Sources/**/*.swift'

  # если есть ресурсы (xib, storyboard, json и т.п.)
  s.resources        = 'Sources/CoreSwiftX/**/*.{xib,storyboard,json}'

  # зависимости можно указать так:
  # s.dependency 'RxSwift'
end
