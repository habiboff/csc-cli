# iOS CLI
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
ios new ProjectName
```

With custom bundle ID:
```bash
ios new ProjectName --bundle-id com.company.app
```

Example:
```bash
ios new MyAwesomeApp
# Bundle ID will be: com.myawesomeapp

ios new MyAwesomeApp --bundle-id com.habiboff.myawesomeapp
# Bundle ID will be: com.habiboff.myawesomeapp
```

## Uninstallation
```bash
sudo rm -f /usr/local/bin/ios
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
