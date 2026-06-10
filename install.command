#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]; then
    echo "Please run with sudo:"
    echo "curl -o- https://raw.githubusercontent.com/habiboff/csc-cli/main/install.command | sudo bash"
    exit 1
fi

cat > /usr/local/bin/csc-cli << 'EOF'
#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

if [ "$1" != "new" ]; then
    echo "Usage: csc-cli new ProjectName [--bundle-id com.company.app]"
    exit 1
fi

PROJECT_NAME="$2"

if [ -z "$PROJECT_NAME" ]; then
    echo -e "${RED}Error: Project name is required!${NC}"
    exit 1
fi

BUNDLE_ID="com.$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]')"

shift 2
while [[ $# -gt 0 ]]; do
    case $1 in
        --bundle-id) BUNDLE_ID="$2"; shift 2 ;;
        *) shift ;;
    esac
done

echo "🔑 Enter your GitHub Personal Access Token:"
read -s GITHUB_TOKEN
echo ""

echo "📥 Cloning template..."
git clone https://$GITHUB_TOKEN@github.com/habiboff/TemplateProject.git "$PROJECT_NAME"

if [ $? -ne 0 ]; then
    echo -e "${RED}Error: Clone failed! Check your token or internet connection.${NC}"
    exit 1
fi

cd "$PROJECT_NAME"
rm -rf .git

echo "🔄 Renaming project files..."
mv TemplateProject.xcodeproj "${PROJECT_NAME}.xcodeproj"
mv TemplateProject "${PROJECT_NAME}"

echo "📝 Updating project references..."
find . -type f -name "*.pbxproj" -exec sed -i '' "s/TemplateProject/$PROJECT_NAME/g" {} +
find . -type f -name "*.swift" -exec sed -i '' "s/TemplateProject/$PROJECT_NAME/g" {} +
find . -type f -name "*.plist" -exec sed -i '' "s/TemplateProject/$PROJECT_NAME/g" {} +

echo "🔑 Updating bundle identifier..."
find . -type f -name "*.pbxproj" -exec sed -i '' "s/com.habiboff.TemplateProject/$BUNDLE_ID/g" {} +

echo -e "${GREEN}✅ Project successfully created: $PROJECT_NAME${NC}"
echo "📱 Bundle ID: $BUNDLE_ID"
echo "📂 Location: $(pwd)"

git init
git add .
git commit -m "Initial commit"
EOF

chmod +x /usr/local/bin/csc-cli
echo -e "${GREEN}✅ CSC CLI successfully installed!${NC}"
echo "Usage: csc-cli new ProjectName [--bundle-id com.company.app]"
