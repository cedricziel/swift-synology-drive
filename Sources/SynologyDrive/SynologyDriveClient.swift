import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

/// SynologyDrive client for interacting with Synology Drive APIs
///
/// This package provides Swift APIs for Synology NAS Drive functionality.
/// The API client is generated from the OpenAPI specification.
///
/// Example usage:
/// ```swift
/// let client = Client(
///     serverURL: try Servers.server1(),
///     transport: URLSessionTransport()
/// )
/// let response = try await client.listEntries()
/// ```
public struct SynologyDriveClient {
    /// The underlying OpenAPI client
    public let client: Client
    
    /// Initialize a new Synology Drive client
    /// - Parameters:
    ///   - serverURL: The URL of your Synology NAS server
    ///   - transport: The transport to use for HTTP requests (defaults to URLSession)
    public init(serverURL: URL, transport: ClientTransport? = nil) throws {
        let clientTransport = transport ?? URLSessionTransport()
        self.client = Client(
            serverURL: serverURL,
            transport: clientTransport
        )
    }
    
    /// List entries in a folder
    /// - Parameter folderID: The ID of the folder to list entries from
    /// - Returns: The list of entries
    public func listEntries(folderID: String? = nil) async throws -> Operations.listEntries.Output {
        return try await client.listEntries(query: .init(folder_id: folderID))
    }
}
