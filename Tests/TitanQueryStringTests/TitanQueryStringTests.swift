import XCTest
import TitanQueryString
import TitanCore

final class TitanQueryStringTests: XCTestCase {
  func testQueryPairs() {
    let path = "/users?verified=true&q=thomas%20catterall"
    let request: RequestType = Request(method: "GET", path: path, body: "", headers: [])
    let parsedQuery = request.queryPairs
    guard parsedQuery.count == 2 else {
      XCTFail()
      return
    }
    XCTAssertEqual(parsedQuery[0].key, "verified")
    XCTAssertEqual(parsedQuery[0].value, "true")

    XCTAssertEqual(parsedQuery[1].key, "q")
    XCTAssertEqual(parsedQuery[1].value, "thomas catterall")
  }
  func testQuery() {
    let path = "/users?verified=true&q=thomas%20catterall&verified=false"
    let request: RequestType = Request(method: "GET", path: path, body: "", headers: [])
    let query = request.query

    XCTAssertEqual(query["q"], "thomas catterall")
    // Check last value wins
    XCTAssertEqual(query["verified"], "false")
  }
}
