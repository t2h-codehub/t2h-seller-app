#!/bin/bash

# Backup the original project file
cp Runner.xcodeproj/project.pbxproj Runner.xcodeproj/project.pbxproj.backup

# Convert to XML format for easier manipulation
plutil -convert xml1 -o Runner.xcodeproj/project.pbxproj.new Runner.xcodeproj/project.pbxproj

# Fix Info.plist settings
sed -i '' 's/INFOPLIST_FILE = "";/INFOPLIST_FILE = "Runner\/Info.plist";/g' Runner.xcodeproj/project.pbxproj.new
sed -i '' 's/GENERATE_INFOPLIST_FILE = YES;/GENERATE_INFOPLIST_FILE = NO;/g' Runner.xcodeproj/project.pbxproj.new

# Fix Pods configuration
sed -i '' 's/PODS_CONFIGURATION_BUILD_DIR = "";/PODS_CONFIGURATION_BUILD_DIR = "\$(BUILD_DIR)\/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)";/g' Runner.xcodeproj/project.pbxproj.new
sed -i '' 's/PODS_PODFILE_DIR_PATH = "";/PODS_PODFILE_DIR_PATH = "\$(SRCROOT)";/g' Runner.xcodeproj/project.pbxproj.new

# Replace the original file
mv Runner.xcodeproj/project.pbxproj.new Runner.xcodeproj/project.pbxproj

# Update xcconfig files
cat > Flutter/Debug.xcconfig << EOL
#include "Pods/Target Support Files/Pods-Runner/Pods-Runner.debug.xcconfig"
#include "Generated.xcconfig"
EOL

cat > Flutter/Release.xcconfig << EOL
#include "Pods/Target Support Files/Pods-Runner/Pods-Runner.release.xcconfig"
#include "Generated.xcconfig"
EOL

cat > Flutter/Profile.xcconfig << EOL
#include "Pods/Target Support Files/Pods-Runner/Pods-Runner.profile.xcconfig"
#include "Generated.xcconfig"
EOL

# Create empty xcfilelist files if they don't exist
mkdir -p "Pods/Target Support Files/Pods-Runner"
touch "Pods/Target Support Files/Pods-Runner/Pods-Runner-frameworks-Debug-input-files.xcfilelist"
touch "Pods/Target Support Files/Pods-Runner/Pods-Runner-frameworks-Debug-output-files.xcfilelist"
touch "Pods/Target Support Files/Pods-Runner/Pods-Runner-resources-Debug-input-files.xcfilelist"
touch "Pods/Target Support Files/Pods-Runner/Pods-Runner-resources-Debug-output-files.xcfilelist"

echo "Project settings updated successfully" 