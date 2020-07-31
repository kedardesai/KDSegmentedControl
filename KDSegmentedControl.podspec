Pod::Spec.new do |s|

	s.platform = :ios
	s.ios.deployment_target = '10.0'
	s.license = 'MIT'
	s.name = 'KDSegmentedControl'
	s.summary = 'An elegant, animated and customizable segmented control for iOS created by Kedar Desai.'
	s.version = '1.4'
	s.author = { "Kedar Desai" => "kedar.dwl@gmail.com" }
	s.homepage = "https://github.com/kedardesai/KDSegmentedControl"
	s.framework = "UIKit"
	s.source = { :git => 'https://github.com/kedardesai/KDSegmentedControl.git', :tag => s.version }
	s.source_files = 'Class/*.{swift}'
	s.swift_version = '4.0'

end