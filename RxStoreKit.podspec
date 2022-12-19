Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "RxStoreKit"
  s.version      = "2.0.0"
  s.summary      = "StoreKit library for RxSwift"
  s.description  = "RxStoreKit is lightweight and easy to use Rx support for StoreKit."
  s.homepage     = "https://github.com/glassonion1/RxStoreKit"
  s.license      = "MIT"
  s.author             = { "Taisuke Fujita" => "glassonion999@gmail.com" }
  s.platform     = :ios, "12.0"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/glassonion1/RxStoreKit.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/**/*.{swift}"
  s.dependency 'RxSwift', '~> 6.0.0'
  s.dependency 'RxCocoa', '~> 6.0.0'
end