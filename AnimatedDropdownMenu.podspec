Pod::Spec.new do |s|
  s.name = 'AnimatedDropdownMenu'
  s.version = '0.1.0'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'A clean interface dropdown menu used on iOS.'
  s.description      = <<-DESC
  AnimatedDropdownMenu is a clean interface dropdown menu, appears underneath navigation bar to display a list of related items when you click on the navigation title.
                       DESC
  s.homepage = 'https://github.com/JonyFang/AnimatedDropdownMenu'
  s.license  = 'MIT'
  s.authors = { 'JonyFang' => 'jony.chunfang@gmail.com' }
  s.source = { :git => 'https://github.com/JonyFang/AnimatedDropdownMenu.git', :tag => s.version }
  
  s.platform = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Source/*'
  s.frameworks = 'UIKit'
end
