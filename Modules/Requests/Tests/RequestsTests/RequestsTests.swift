import XCTest
@testable import Requests

final class RequestsTests: XCTestCase {
    
    typealias StubbedEndpoint = Endpoint<EndpointKinds.Stub, String>
    
    func testBasicPathRequestGeneration() {
        let endpoint = Endpoint<EndpointKinds.Stub, String>(path: "public/characters")
        let request = endpoint.makeRequest(with: ())
        XCTAssertEqual(request?.components?.path, "/public/characters")
        
    }
}
