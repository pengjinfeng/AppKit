Pod::Spec.new do |s|

  s.name         = "AppKit"
  s.version      = "2.0.5"
  s.summary      = "AppKit is just test"
  s.description  = <<-DESC
		   AppKit 将会是一个全面的framework框架，包含所有的app开发需要的快捷方法，将会给你的开发带来极大的方便!
                   DESC

  s.homepage     = "https://github.com/pengjinfeng/AppKit"
  s.license 	 = { :type => "MIT", :file => "LICENSE" }
  s.author       = {"JinFeng" => "peng_jinfeng@163.com" }
  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/pengjinfeng/AppKit.git", :tag => s.version }

  s.source_files = 'Sources/net/*','Sources/device/*','Sources/date/*','Sources/view/*','Sources/color/*'

  s.requires_arc = true

  s.swift_version = "5.0"

  s.dependency "Alamofire"
  
end