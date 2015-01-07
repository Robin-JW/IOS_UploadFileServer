Pod::Spec.new do |s|

  s.name         = "IOS_UploadFileServer"
  s.version      = "1.0.0"
  s.summary      = "IOS_UploadFileServer"
  s.homepage     = "http://git.oschina.net/gejw0623/IOS_UploadFileServer"
  s.author       = { "robinge" => "gejw0623@yeah.net" }

  s.ios.deployment_target = "7.0"
  s.osx.deployment_target = "10.9"
  s.source       = { :git => "https://git.oschina.net/gejw0623/IOS_UploadFileServer.git" }
  s.source_files = "TCP/**/*.{h,m}", "HTTP/**/*.{h,m}", "Logging/**/*.{h,m}"
  s.requires_arc = true
  s.dependency 'ASIHTTPRequest'
  s.dependency 'JSONKit'

end
