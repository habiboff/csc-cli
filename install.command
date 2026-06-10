#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]; then
    echo "Please run with sudo:"
    echo "curl -o- https://raw.githubusercontent.com/habiboff/csc-cli/main/install.command | sudo bash"
    exit 1
fi

curl -o /usr/local/bin/csc-cli https://raw.githubusercontent.com/habiboff/csc-cli/main/csc-cli
chmod +x /usr/local/bin/csc-cli

echo -e "${GREEN}✅ CSC CLI successfully installed!${NC}"
echo "Usage: csc-cli new ProjectName [--bundle-id com.company.app]"
