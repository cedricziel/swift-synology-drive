# SynologyDrive

[![Swift CI](https://github.com/cedricziel/swift-synology-drive/actions/workflows/swift.yml/badge.svg)](https://github.com/cedricziel/swift-synology-drive/actions/workflows/swift.yml)
[![Swift Version](https://img.shields.io/badge/Swift-6.0+-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS%20%7C%20visionOS-lightgrey.svg)](https://developer.apple.com)

A Swift package for interacting with Synology Drive APIs. This package provides type-safe Swift APIs generated from the official Synology Drive OpenAPI specification.

## Features

- 🚀 Type-safe Swift APIs generated from OpenAPI specification
- 📱 Support for iOS, macOS, tvOS, watchOS, and visionOS
- ✅ Comprehensive test coverage
- 🔄 Automatic dependency updates via Dependabot
- 🛠 Built with Swift OpenAPI Generator

## Requirements

- Swift 6.0 or later
- Xcode 16.0 or later (for iOS/macOS development)
- Supported platforms:
  - macOS 13.0+
  - iOS 16.0+
  - tvOS 16.0+
  - watchOS 9.0+
  - visionOS 1.0+

## Installation

### Swift Package Manager

Add this package to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/cedricziel/swift-synology-drive.git", from: "1.0.0")
]
```

Then add the dependency to your target:

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "SynologyDrive", package: "swift-synology-drive")
        ]
    )
]
```

### Xcode

1. In Xcode, select **File → Add Package Dependencies...**
2. Enter the repository URL: `https://github.com/cedricziel/swift-synology-drive.git`
3. Select the version or branch you want to use
4. Add the `SynologyDrive` library to your target

## Usage

### Basic Setup

```swift
import SynologyDrive

// Create a client instance
let client = try SynologyDriveClient(
    serverURL: URL(string: "https://your-synology-nas.local")!
)

// Use the client to interact with your Synology Drive
let entries = try await client.listEntries(folderID: "root")
```

### Custom Configuration

```swift
import SynologyDrive
import OpenAPIURLSession

// Create a client with custom transport configuration
let transport = URLSessionTransport()
let client = try SynologyDriveClient(
    serverURL: URL(string: "https://your-nas.synology.me:5001")!,
    transport: transport
)
```

## API Documentation

The package is generated from the official Synology Drive OpenAPI specification available at:
https://office-suite-api.synology.com/specs/Synology-Drive/openapi_v1.json

**⚠️ Important Note:** The current `Sources/SynologyDrive/openapi.json` file contains a placeholder specification with basic examples. To use the full Synology Drive API, you need to:

1. Download the actual OpenAPI specification from the URL above
2. Replace `Sources/SynologyDrive/openapi.json` with the downloaded file
3. Run `swift build` to regenerate the client code with all available API endpoints

For detailed API documentation, please refer to the official Synology Drive API documentation.

## Development

### Building the Package

```bash
swift build
```

### Running Tests

```bash
swift test
```

### Updating the OpenAPI Specification

To update the API client with the latest OpenAPI specification:

1. Download the latest spec from the Synology API documentation
2. Replace `Sources/SynologyDrive/openapi.json` with the new specification
3. Run `swift build` to regenerate the client code

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Built with [Swift OpenAPI Generator](https://github.com/apple/swift-openapi-generator)
- Uses [Swift OpenAPI Runtime](https://github.com/apple/swift-openapi-runtime)
- Transport provided by [Swift OpenAPI URLSession](https://github.com/apple/swift-openapi-urlsession)

## Support

If you encounter any issues or have questions, please file an issue on the [GitHub issue tracker](https://github.com/cedricziel/swift-synology-drive/issues).
