Pod::Spec.new do |s|
  s.name         = "Snorlax"
  s.version      = "0.2.1"
  s.summary      = "Snoozing for everyone"
  s.description  = <<-DESC
                   Snoozing for everyone!

                   Snorlax allows you to sleep on the current thread for a
                   random amount of time.

                   In truth, Snorlax is an example library demostrating how to build libraries that support multiple platforms:
                    - Carthage
                    - CocoaPods
                    - Swift Package Manager
                    - OS X
                    - iOS
                    - watchOS
                    - tvOS
                    - Linux

                   See the source at https://github.com/jeffh/Snorlax
                   DESC

  s.homepage     = "https://github.com/tryswift/Snorlax"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Jeff Hui" => "jeff@jeffhui.net" }
  s.social_media_url   = "http://twitter.com/jeffhui"

  s.ios.deployment_target = "9.0"
  s.osx.deployment_target = "10.11"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/tryswift/Snorlax.git", :tag => "v#{s.version}" }

  s.source_files  = "Sources/Snorlax/*.{h,m,swift}"
  s.public_header_files = "Sources/Snorlax/*.h"

  s.framework  = "Foundation"
  s.dependency   "PromiseKit", "~> 3.0"
end
