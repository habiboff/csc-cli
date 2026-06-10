#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]; then
    echo "Please run with sudo:"
    echo "curl -o- https://raw.githubusercontent.com/habiboff/csc-cli/main/install.command | sudo bash"
    exit 1
fi

curl -o /usr/local/bin/ios https://raw.githubusercontent.com/habiboff/csc-cli/main/ios
chmod +x /usr/local/bin/ios

echo -e "${GREEN}✅ iOS CLI successfully installed!${NC}"
echo "Usage: ios new ProjectName [--bundle-id com.company.app]"
