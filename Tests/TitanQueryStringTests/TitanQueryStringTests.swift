import XCTest
import TitanQueryString
import TitanCore

class TitanQueryStringTests: XCTestCase {
    func testExample() {
      let path = "/users?verified=true&q=thomas%20catterall"
      let request: RequestType = Request("GET", path, "", headers: [])
      let parsedQuery = request.query
      guard parsedQuery.count == 2 else {
        XCTFail()
        return
      }
      XCTAssertEqual(parsedQuery[0].key, "verified")
      XCTAssertEqual(parsedQuery[0].value, "true")

      XCTAssertEqual(parsedQuery[1].key, "q")
      XCTAssertEqual(parsedQuery[1].value, "thomas catterall")
    }


    static var allTests : [(String, (TitanQueryStringTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
