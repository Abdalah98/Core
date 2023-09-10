Pod::Spec.new do |spec|

      spec.name         = "Core"
      spec.version      = "1.0.0"
      spec.summary      = "The Core App."
      spec.description  = "that  Core include A customizable activity indicator view and A library to load and cache images from URLs and A library to call Networking any APIs Service and A customizable BaseTableViewModel for iOS to used any app  ."
                     
    spec.homepage     = ""

      spec.license      = "MIT"
      spec.author       = { "Abdullah Omar" => "Abdullah.Omar@Fawry.com" }
      
      spec.platform     = :ios, "14.0"

      spec.source       = {  :git => "/Users/abdullah.omar/Documents/Core"}
      spec.source_files  = "Core/**/*"
      spec.swift_versions = "5.0"
    end

