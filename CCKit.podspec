Pod::Spec.new do |s|
  s.name         = "CCKit"
  s.version      = "0.1.0"
  s.summary      = "A Kit of Extension and Network for iOS"
  s.description  = <<-DESC
                    CCKit framework.
                   DESC
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/DingSoung/CCKit.git",
                     :tag => s.version }

  s.source_files  = "CCKit/**/*.{swift}", "CCKit/**/**/*.{swift}"
  s.public_header_files = ["CCKit/CCKit.h"]
end
