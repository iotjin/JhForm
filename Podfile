# 指明依赖库的来源地址，不使用默认 CDN
source 'https://github.com/CocoaPods/Specs.git'

# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

# 屏蔽所有第三方框架警告
inhibit_all_warnings!

target 'JhForm' do
  # Comment the next line if you don't want to use dynamic frameworks
  # use_frameworks!

  # Pods for JhForm
  pod 'IQKeyboardManager'
  pod 'HXPhotoPicker'
  pod 'SDWebImage'
  pod 'Masonry'

  target 'JhFormTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'JhFormUITests' do
    # Pods for testing
  end
  
  # 更改所有第三方框架 Target 版本
  post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
    end
  end

end
