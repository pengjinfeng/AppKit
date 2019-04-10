Pod::Spec.new do |s|

  s.name         = "AppKit"
  s.version      = "1.0.0"
  s.summary      = "AppKit is just test"
  s.description  = <<-DESC
		   AppKit is just test
                   DESC

  s.homepage     = "https://github.com/pengjinfeng/AppKit"
  s.license      = "MIT"
  s.author       = {"JinFeng" => "peng_jinfeng@163.com" }
  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/pengjinfeng/AppKit.git", :tag => "#{s.version}" }

  s.source_files = 'Sources/*'

  s.requires_arc = true
  s.swift_version = '5.0'

end