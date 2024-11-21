# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'InventoryApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
pod 'Alamofire'
pod 'DropDown'
pod 'IQKeyboardManagerSwift'


end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
  end

  fuse_path = "./Pods/HyperSDK/Fuse.rb"
  clean_assets = true # Pass true to re-download all the assets
  if File.exist?(fuse_path)
    system("ruby", fuse_path.to_s, clean_assets.to_s)
  end
end
