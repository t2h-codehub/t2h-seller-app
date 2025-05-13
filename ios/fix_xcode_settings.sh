#!/bin/bash

# Fix Info.plist path and settings
plutil -convert xml1 -o Runner.xcodeproj/project.pbxproj.new Runner.xcodeproj/project.pbxproj
sed -i '' 's/INFOPLIST_FILE = "";/INFOPLIST_FILE = "Runner\/Info.plist";/g' Runner.xcodeproj/project.pbxproj.new
sed -i '' 's/GENERATE_INFOPLIST_FILE = YES;/GENERATE_INFOPLIST_FILE = NO;/g' Runner.xcodeproj/project.pbxproj.new
mv Runner.xcodeproj/project.pbxproj.new Runner.xcodeproj/project.pbxproj

# Fix Pods configuration
echo "#include \"Pods/Target Support Files/Pods-Runner/Pods-Runner.debug.xcconfig\"" > Flutter/Debug.xcconfig
echo "#include \"Pods/Target Support Files/Pods-Runner/Pods-Runner.release.xcconfig\"" > Flutter/Release.xcconfig
echo "#include \"Pods/Target Support Files/Pods-Runner/Pods-Runner.profile.xcconfig\"" > Flutter/Profile.xcconfig

echo "Xcode project settings updated successfully" 