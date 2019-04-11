Pod::Spec.new do |s|

  s.name         = "AppKit"
  s.version      = "1.0.0"
  s.summary      = "AppKit is just test"
  s.description  = <<-DESC
		   AppKit is just test, this is a good kit can use is open every you code you code ,thanks!
                   DESC

  s.homepage     = "https://github.com/pengjinfeng/AppKit"
  s.license 	 = { :type => "MIT", :file => "LICENSE" }
  s.author       = {"JinFeng" => "peng_jinfeng@163.com" }
  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/pengjinfeng/AppKit.git", :tag => "1.0.0" }

  s.source_files = 'Sources/*'

  s.requires_arc = true

  s.swift_version = "5.0"

  s.dependency "Alamofire"
  
end