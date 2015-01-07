Pod::Spec.new do |s|

  s.name         = "IOS_UploadFileServer"
  s.version      = "1.0.0"
  s.summary      = "httpserver"
  s.homepage     = "https://github.com/gejw0623/IOS_UploadFileServer"
  s.author       = { "Robin" => "gejw0623@yeah.net" }

  s.ios.deployment_target = "7.0"
  s.osx.deployment_target = "10.9"
  s.source       = { :git => "https://github.com/gejw0623/IOS_UploadFileServer.git" }
  s.source_files = "IOS_UploadFileServer/TCP/*.{h,m}", "IOS_UploadFileServer/HTTP/**/*.{h,m}", "IOS_UploadFileServer/HTTP/*.{h,m}", "IOS_UploadFileServer/Logging/*.{h,m}", "IOS_UploadFileServer/Logging/**/*.{h,m}"
  s.requires_arc = true

end
