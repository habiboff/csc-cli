#!/bin/bash

# Color codes
GREEN='\033[0;32m'
NC='\033[0m'

# Permission check
if [ "$EUID" -ne 0 ]; then 
    echo "Please run with sudo:"
    echo "curl -o- https://raw.githubusercontent.com/habiboff/csc-cli/main/install.command | sudo bash"
    exit 1
fi

# Create CLI tool
cat > /usr/local/bin/csc-cli << 'EOF'
#!/bin/bash

if [ "$1" != "create" ] || [ "$2" != "ios-project" ]; then
    echo "Usage: csc-cli create ios-project --name ProjectName --bundle-id com.company.app"
    exit 1
fi

while [[ $# -gt 0 ]]; do
    case $1 in
        --name) PROJECT_NAME="$2"; shift 2 ;;
        --bundle-id) BUNDLE_ID="$2"; shift 2 ;;
        *) shift ;;
    esac
done

if [ -z "$PROJECT_NAME" ] || [ -z "$BUNDLE_ID" ]; then
    echo "Error: Project name and bundle ID are required!"
    exit 1
fi

# Clone template from the template repo
echo "📥 Cloning template..."
git clone https://github.com/habiboff/GIRDM.git "$PROJECT_NAME"
cd "$PROJECT_NAME"
rm -rf .git

# Rename files and directories
echo "🔄 Renaming project files..."
mv GIRDM.xcodeproj "${PROJECT_NAME}.xcodeproj"
mv GIRDM "${PROJECT_NAME}"

# Update references in project files
echo "📝 Updating project references..."
find . -type f -name "*.pbxproj" -exec sed -i '' "s/GIRDM/$PROJECT_NAME/g" {} +
find . -type f -name "*.swift" -exec sed -i '' "s/GIRDM/$PROJECT_NAME/g" {} +
find . -type f -name "*.plist" -exec sed -i '' "s/GIRDM/$PROJECT_NAME/g" {} +
find . -type f -name "*.h" -exec sed -i '' "s/GIRDM/$PROJECT_NAME/g" {} +
find . -type f -name "*.m" -exec sed -i '' "s/GIRDM/$PROJECT_NAME/g" {} +

# Update bundle identifier
echo "🔑 Updating bundle identifier..."
find . -name "Info.plist" -exec sed -i '' "s/com.habiboff.GIRDM/$BUNDLE_ID/g" {} +
find . -type f -name "*.pbxproj" -exec sed -i '' "s/com.habiboff.GIRDM/$BUNDLE_ID/g" {} +

echo -e "${GREEN}✅ Project successfully created: $PROJECT_NAME${NC}"
echo "📱 Bundle ID: $BUNDLE_ID"
echo "📂 Location: $(pwd)"
EOF

# Make CLI tool executable
chmod +x /usr/local/bin/csc-cli

echo -e "${GREEN}✅ CSC CLI successfully installed!${NC}"
echo "Usage: csc-cli create ios-project --name ProjectName --bundle-id com.company.app"
