# CSC CLI

A command-line tool for creating iOS projects with GIRDM template. This tool helps you quickly scaffold iOS projects with a predefined VMMMC architecture.

## Features
- Quick project setup with VMMMC architecture
- Automatic bundle identifier configuration
- Clean and organized project structure
- Ready-to-use networking and repository layers
- Built-in routing system
- State management implementation

## Requirements
- macOS
- Git
- Xcode

## Installation

```bash
curl -o- https://raw.githubusercontent.com/habiboff/csc-cli/main/install.command | sudo bash
```

## Usage

Create a new project:
```bash
csc-cli create ios-project --name ProjectName --bundle-id com.company.app
```

Example:
```bash
csc-cli create ios-project --name MyAwesomeApp --bundle-id com.mycompany.awesomeapp
```

## Project Structure
The generated project will include:
- VMMMC architecture setup
- Common utilities
- Main application flow
- Routing system
- Root configurations

## Uninstallation
To remove CSC CLI from your system:

```bash
# Remove the CLI tool
sudo rm -f /usr/local/bin/csc-cli

# Optional: Remove any existing projects
# Note: This will delete all projects created with CSC CLI
# rm -rf ProjectName
```

## Common Issues

### Permission Denied
If you get a permission error during installation, make sure to use `sudo`:
```bash
curl -o- https://raw.githubusercontent.com/habiboff/csc-cli/main/install.command | sudo bash
```

### Project Already Exists
If you try to create a project with a name that already exists in the current directory, you'll get an error. Choose a different name or move to another directory.

## Contributing
Feel free to submit issues and enhancement requests.

## License
MIT

## Author
[Your Name/Organization]

## Support
For support, please create an issue in the repository.
