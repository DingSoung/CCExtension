Pod::Spec.new do |s|
  s.name         = "CCKit"
  s.version      = "0.3.3"
  s.summary      = "A light weight framework"
  s.description  = <<-DESC
                   A Kit of Extension and Network for iOS.
                   DESC
  s.ios.deployment_target = "8.0"
  s.source       ={:git => "https://github.com/DingSoung/CCKit.git", :tag => s.version,}

  s.source_files  = "CCKit/*.h"
  s.author             = { "SongWen Ding" => "DingSoung@gmail.com" }
  s.license      = "MIT"
  s.homepage     = "http://DingSoung.tk"
end
