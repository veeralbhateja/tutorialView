Pod::Spec.new do |s|
  s.name             = 'TutorialView'
  s.version          = '0.3.0'
  s.summary          = 'The easiest way to create Tutorial Screen for any application. Just put in the name of the images separated by "," (coma)'
 
  s.description      = <<-DESC
This Tutorial view, the easiest way to show tutorial screen in your app just in one minute!
                       DESC
 
  s.homepage         = 'https://github.com/veeralbhateja/tutorialView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Veeral Bhateja' => 'veeral.bhateja@gmail.com' }
  s.source           = { :git => 'https://github.com/veeralbhateja/tutorialView.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'TutorialApp/*.{swift,xib}'
 
end