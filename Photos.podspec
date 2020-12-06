Pod::Spec.new do |spec|

  spec.name         = "Photos"
  spec.version      = "1.0.2"
  spec.summary      = "A networking framework to fetch images from Unsplash API."

  spec.description  = "Fetch images using the Unsplash API. The images fetched are smaller in size and great for displaying them in a collection view."

  spec.homepage     = "https://github.com/ljrocha/Photos"

  spec.license      = "MIT"

  spec.author       = { "ljrocha" => "ljrocha@users.noreply.github.com" }

  spec.platform     = :ios, "14.2"

  spec.source       = { :git => "https://github.com/ljrocha/Photos.git", :tag => "1.0.0" }

  spec.source_files  = "Photos/**/*.{swift, h, m}"

  spec.swift_version = "5.0"
end
