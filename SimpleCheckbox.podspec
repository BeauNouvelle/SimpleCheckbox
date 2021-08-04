#
#  Be sure to run `pod spec lint SimpleCheckbox.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "SimpleCheckbox"
  s.version      = "2.2.2"
  s.summary      = "A simple checkbox."
  s.swift_version = '5.1'

  s.description  = <<-DESC
  SimpleCheckbox aims to accomplish what other iOS checkbox controls haven't. To be simple. There's no animations, no IBDesignable to slow down interface builder, and no performance heavy draw methods.
                   DESC

  s.homepage     = "https://github.com/BeauNouvelle/SimpleCheckbox"
  s.screenshots  = "https://raw.githubusercontent.com/BeauNouvelle/SimpleCheckbox/master/demo/images/banner.png"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author    = "Beau Nouvelle"
  s.social_media_url   = "http://twitter.com/BeauNouvelle"

  s.platform     = :ios, "11.0"

  s.source       = { :git => "https://github.com/BeauNouvelle/SimpleCheckbox.git", :tag => "#{s.version}" }

  s.source_files  = "checkbox/*.{swift}"

end
