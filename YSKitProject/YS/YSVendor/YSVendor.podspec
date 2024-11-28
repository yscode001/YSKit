Pod::Spec.new do |s|
  s.name                      = "YSVendor"
  s.version                   = "1.0.0"
  s.summary                   = "对常用三方库的封装"
  s.license                   = "MIT"
  s.author                    = {"ys" => "yscode@126.com"}
  s.platform                  = :ios, "13.0"
  s.swift_version             = "5.3"
  s.requires_arc              = true
  s.homepage                  = "https://github.com/yscode001/YSExt"
  s.source                    = {:git => "https://github.com/yscode001/YSExt.git", :tag => "#{s.version}"}
  
  s.frameworks                = "UIKit"
  
  # 基于以下三方库的封装
  s.dependency                'MJRefresh'
  s.dependency                'SDWebImage'
  s.dependency		      'SAMKeychain'
  
  # 依赖库
  s.dependency                'YSKit'
  
  s.source_files              = [
  "WebImage/*.swift",
  "RefreshControl/*.swift",
  "KeyChain/*.swift"
  ]
end
