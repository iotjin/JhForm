platform :ios, '9.0'
target 'JhForm' do
  
  
  # 屏蔽所有第三方框架警告
  inhibit_all_warnings!
  
  #  选择图片依赖HXPhotoPicker和SDWebImage，可以分开加或者使用： pod 'HXPhotoPicker/SDWebImage', '3.3.1'
  pod 'HXPhotoPicker', '3.3.1'
  pod 'SDWebImage', '5.10.0'
  # 选择图片下载在线视频需要使用AFNetworking
  pod 'AFNetworking', '4.0.1'
  # 可选，建议加
  pod 'IQKeyboardManager', '6.5.6'
  
  pod 'MLeaksFinder', :git => 'https://github.com/Zepo/MLeaksFinder.git'

  
  # 更改所有第三方框架 Target 版本
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
      end
    end
  end
  
end
