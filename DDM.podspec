#
# Be sure to run `pod lib lint DDM.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'DDM'
    s.version          = '0.1.1'
    s.summary          = 'Data Display Manager'
    
    s.description      = 'Data Display Manager for TableView & CollectionView with MVVM'
    
    s.homepage         = 'https://github.com/dev-lis/DDM'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'dev-lis' => 'mr.aleksandr.lis@gmail.com' }
    s.source           = { :git => 'https://github.com/dev-lis/ddm.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '12.0'
    s.swift_version = '5.0'
    
    s.source_files = 'DDM/Sources/**/*.{h,m,swift}'
end
