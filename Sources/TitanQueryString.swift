import TitanCore
import Foundation

public extension RequestType {
  public var queryPairs: [(key: String, value: String)] {
    guard let queryItems = URLComponents(string: self.path)?.queryItems else {
      return []
    }
    return queryItems.map { return (key: $0.name, value: $0.value ?? "") }
  }
  public var query: [String:String] {
    var query: [String:String] = [:]
    for (name, value) in self.queryPairs {
      query[name] = value
    }
    return query
  }
}
