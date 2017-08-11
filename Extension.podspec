Pod::Spec.new do |s|
  s.name        = "Extension"
  s.version     = "0.4.3"
  s.summary     = "no summary"
  s.homepage    = "https://github.com/DingSoung"
  s.license     = { :type => "MIT" }
  s.authors     = { "Songwen Ding" => "DingSoung@gmail.com"}

  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/DingSoung/Extension.git", :tag => s.version }
  s.source_files = "Extension/**/*.swift"
  s.pod_target_xcconfig =  {
        'SWIFT_VERSION' => '3.1',
  }
end