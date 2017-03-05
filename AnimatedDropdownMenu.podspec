Pod::Spec.new do |s|
  s.name = 'AnimatedDropdownMenu'
  s.version = '0.3.1'
  s.summary = 'A clean interface dropdown menu used on iOS.'
  s.description      = <<-DESC
                       AnimatedDropdownMenu is a clean interface dropdown menu, appears underneath navigation bar to display a list of related items when you click on the navigation title.
                       DESC
  s.homepage = 'https://github.com/JonyFang/AnimatedDropdownMenu'
  s.license  = 'MIT'
  s.authors = { 'JonyFang' => 'jony.chunfang@gmail.com' }
  s.source = { :git => 'https://github.com/JonyFang/AnimatedDropdownMenu.git', :tag => s.version.to_s }
  
  s.platform = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Source/*.swift'
  s.resources = 'Source/*.bundle'
end
