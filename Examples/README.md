# SynologyDrive Usage Examples

This directory contains examples of how to use the SynologyDrive Swift package.

## Basic Usage

### Creating a Client

```swift
import SynologyDrive

// Create a client instance
let client = try SynologyDriveClient(
    serverURL: URL(string: "https://your-synology-nas.local")!
)
```

### Custom Server URL

```swift
import SynologyDrive

// For custom ports or HTTPS
let client = try SynologyDriveClient(
    serverURL: URL(string: "https://your-nas.synology.me:5001")!
)
```

### Using Custom Transport

```swift
import SynologyDrive
import OpenAPIURLSession
import Foundation

// Create a custom URLSession with specific configuration
let configuration = URLSessionConfiguration.default
configuration.timeoutIntervalForRequest = 30
configuration.timeoutIntervalForResource = 300

let session = URLSession(configuration: configuration)
let transport = URLSessionTransport(configuration: .init(session: session))

let client = try SynologyDriveClient(
    serverURL: URL(string: "https://your-nas.local")!,
    transport: transport
)
```

### Listing Entries

```swift
import SynologyDrive

let client = try SynologyDriveClient(
    serverURL: URL(string: "https://your-nas.local")!
)

// List entries in root folder
let response = try await client.listEntries()

// List entries in specific folder
let response = try await client.listEntries(folderID: "folder_123")
```

### Error Handling

```swift
import SynologyDrive

do {
    let client = try SynologyDriveClient(
        serverURL: URL(string: "https://your-nas.local")!
    )
    
    let response = try await client.listEntries()
    
    // Handle response
    switch response {
    case .ok(let okResponse):
        // Process successful response
        print("Success!")
    case .undocumented(statusCode: let statusCode, _):
        print("Unexpected response: \(statusCode)")
    }
} catch {
    print("Error: \(error)")
}
```

## SwiftUI Example

```swift
import SwiftUI
import SynologyDrive

@MainActor
class DriveViewModel: ObservableObject {
    @Published var entries: [Components.Schemas.Entry] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private let client: SynologyDriveClient
    
    init(serverURL: URL) throws {
        self.client = try SynologyDriveClient(serverURL: serverURL)
    }
    
    func loadEntries() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let response = try await client.listEntries()
            
            switch response {
            case .ok(let okResponse):
                // Extract entries from response
                // This is a placeholder - actual implementation depends on the API spec
                self.entries = []
            case .undocumented(statusCode: let statusCode, _):
                self.error = NSError(
                    domain: "SynologyDrive",
                    code: statusCode,
                    userInfo: [NSLocalizedDescriptionKey: "Unexpected response"]
                )
            }
        } catch {
            self.error = error
        }
    }
}

struct DriveView: View {
    @StateObject private var viewModel: DriveViewModel
    
    init(serverURL: URL) throws {
        _viewModel = StateObject(wrappedValue: try DriveViewModel(serverURL: serverURL))
    }
    
    var body: some View {
        List(viewModel.entries, id: \.id) { entry in
            Text(entry.name ?? "Unknown")
        }
        .task {
            await viewModel.loadEntries()
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
    }
}
```

## Notes

- Replace `your-synology-nas.local` with your actual Synology NAS address
- The actual OpenAPI specification should be obtained from the official Synology API documentation
- The placeholder spec in this package includes basic examples - replace with the real spec for full functionality
- For authentication, you'll need to add authentication headers or tokens as required by the Synology Drive API
