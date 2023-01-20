Pod::Spec.new do |s|
  s.name                      = "YSKit"
  s.version                   = "1.0.0"
  s.summary                   = "iOS开发工具库"
  s.license                   = "MIT"
  s.author                    = {"ys" => "yscode@126.com"}
  s.platform                  = :ios, "10.0"
  s.frameworks                = "UIKit", "WebKit", "UserNotifications"
  s.swift_version             = "5.3"
  s.requires_arc              = true
  s.homepage                  = "https://github.com/yscode001/YSExt"
  s.source                    = {:git => "https://github.com/yscode001/YSExt.git", :tag => "#{s.version}"}
  
  s.subspec "Core" do |ss|
    ss.source_files         = ["Core/**/*.swift"]
  end
  
  s.subspec "Ctor" do |ss|
    ss.source_files         = ["Ctor/**/*.swift"]
  end
  
  s.subspec "Extension" do |ss|
    ss.dependency           'YSKit/Core'
    ss.source_files         = ["Extension/**/*.swift", "Extension/**/**/*.swift"]
  end
  
  s.subspec "Control" do |ss|
    ss.dependency           'YSKit/Core'
    ss.source_files         = ["Control/**/*.swift"]
  end
  
  s.subspec "PlaceholderView" do |ss|
    ss.dependency           'YSKit/Core'
    ss.source_files         = ["PlaceholderView/**/*.swift"]
  end
  
  s.subspec "Database" do |ss|
    ss.dependency           'YSKit/Core'
    ss.dependency           'YSKit/Extension'
    ss.source_files         = ["Database/*.swift"]
  end
  
  s.subspec "Base" do |ss|
    ss.source_files         = ["Base/**/*.swift"]
  end
  
  s.subspec "Tool" do |ss|
    ss.source_files         = ["Tool/*.swift"]
  end

end