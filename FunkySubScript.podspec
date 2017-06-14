
Pod::Spec.new do |s|
  s.name             = 'FunkySubScript'
  s.version          = '0.1.0'
  s.summary          = 'FunkySubScript'

  s.description      = <<-DESC
FunkySubScript 是FM的订阅听模块
                       DESC

  s.homepage         = 'https://github.com/funkyHS/FunkySubScript'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'funkyHS' => 'hs1024942667@163.com' }
  s.source           = { :git => 'https://github.com/funkyHS/FunkySubScript.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'FunkySubScript/Classes/**/*'
  
   s.resource_bundles = {
     'FunkySubScript' => ['FunkySubScript/Assets/*']
   }


s.dependency 'FunkySegmentBar'
s.dependency 'FunkyFMBase/Base'
s.dependency 'FunkyFMBase/Network'
s.dependency 'MJExtension'



end
