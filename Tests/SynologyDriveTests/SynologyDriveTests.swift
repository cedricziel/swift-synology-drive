import XCTest
@testable import SynologyDrive

final class SynologyDriveTests: XCTestCase {
    
    func testClientInitialization() throws {
        // Test that we can create a client with a valid URL
        let serverURL = URL(string: "https://example.synology.me")!
        let client = try SynologyDriveClient(serverURL: serverURL)
        
        XCTAssertNotNil(client.client)
    }
    
    func testClientInitializationWithCustomURL() throws {
        // Test that we can create a client with a custom URL
        let serverURL = URL(string: "https://my-nas.local:5001")!
        let client = try SynologyDriveClient(serverURL: serverURL)
        
        XCTAssertNotNil(client.client)
    }
}
