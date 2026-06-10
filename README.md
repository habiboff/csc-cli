# CSC CLI
A command-line tool for creating iOS UIKit projects with Clean Architecture template.

## Features
- Clean Architecture + MVVM+R structure
- Automatic bundle identifier configuration
- Private template repo support via GitHub token
- Ready-to-use base classes and routing system

## Requirements
- macOS
- Xcode
- Git

## Installation
```bash
curl -o- https://raw.githubusercontent.com/habiboff/csc-cli/main/install.command | sudo bash
```

## Usage
Create a new project:
```bash
csc-cli new ProjectName
```

With custom bundle ID:
```bash
csc-cli new ProjectName --bundle-id com.company.app
```

Example:
```bash
csc-cli new MyAwesomeApp
# Bundle ID will be: com.app

csc-cli new MyAwesomeApp --bundle-id com.app.myawesomeapp
# Bundle ID will be: com.app.myawesomeapp
```

## Uninstallation
```bash
sudo rm -f /usr/local/bin/csc-cli
```

## Common Issues

### Permission Denied
```bash
curl -o- https://raw.githubusercontent.com/habiboff/csc-cli/main/install.command | sudo bash
```

### Project Already Exists
Choose a different name or navigate to another directory.

## Author
Nahid Habibov

## License
MIT
