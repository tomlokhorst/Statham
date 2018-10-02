Pod::Spec.new do |s|
  s.name         = "Statham"
  s.version      = "2.0.0"
  s.license      = "MIT"

  s.summary      = "Swift library for decoding JSON"

  s.description  = <<-DESC
    Exposes the `ValueOrDecodingError<Wrapped>` type.
                   DESC

  s.authors           = { "Tom Lokhorst" => "tom@lokhorst.eu" }
  s.social_media_url  = "https://twitter.com/tomlokhorst"
  s.homepage          = "https://github.com/tomlokhorst/Statham"

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'

  s.source          = { :git => "https://github.com/tomlokhorst/Statham.git", :tag => s.version }
  s.requires_arc    = true
  s.default_subspec = "Core"
  s.swift_version   = '4.2'

  s.subspec "Core" do |ss|
    ss.source_files  = "Sources"
  end

end
