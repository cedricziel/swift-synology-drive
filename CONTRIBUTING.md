# Contributing to SynologyDrive

Thank you for your interest in contributing to SynologyDrive! We welcome contributions from the community.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/YOUR_USERNAME/swift-synology-drive.git`
3. Create a new branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Run tests: `swift test`
6. Commit your changes: `git commit -am 'Add some feature'`
7. Push to the branch: `git push origin feature/your-feature-name`
8. Create a Pull Request

## Development Setup

### Prerequisites

- Swift 6.0 or later
- Xcode 16.0 or later (for macOS/iOS development)

### Building the Package

```bash
swift build
```

### Running Tests

```bash
swift test
```

## Updating the OpenAPI Specification

The API client is generated from the OpenAPI specification located at `Sources/SynologyDrive/openapi.json`.

To update the specification:

1. Download the latest spec from https://office-suite-api.synology.com/specs/Synology-Drive/openapi_v1.json
2. Replace `Sources/SynologyDrive/openapi.json` with the new specification
3. Run `swift build` to regenerate the client
4. Run tests to ensure everything still works
5. Submit a pull request with your changes

## Code Style

- Follow Swift's official [API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- Use SwiftFormat for code formatting (if available)
- Write clear, descriptive commit messages
- Include tests for new features

## Pull Request Process

1. Ensure your code builds and all tests pass
2. Update the README.md with details of changes if applicable
3. Update documentation if you're adding or changing functionality
4. Your PR will be reviewed by maintainers
5. Address any feedback from reviewers
6. Once approved, your PR will be merged

## Reporting Issues

If you find a bug or have a feature request:

1. Check if the issue already exists
2. If not, create a new issue with:
   - Clear description of the problem or feature
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior
   - Swift version and platform information

## Questions?

Feel free to open an issue for questions or discussions about the project.

## License

By contributing to SynologyDrive, you agree that your contributions will be licensed under the MIT License.
