Pod::Spec.new do |s|
    s.name         = 'MicroButton'
    s.version      = '1.0.0'
    s.summary      = 'A simple version of voice microphone animation'
    s.homepage     = 'https://github.com/mathtao/MicroButton'
    s.license      = 'MIT'
    s.authors      = {'mathtao' => '409426819@qq.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/mathtao/MicroButton.git', :tag => s.version}
    s.source_files = 'MicroButton/Classes/*.{h,m}'
    s.resource_bundles = {
        'MicroButton' => ['MicroButton/Assets/*.png']
    }
    s.requires_arc = true
end
