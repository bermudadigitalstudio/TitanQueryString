import TitanCore
import Foundation

public extension RequestType {
  public var query: [(key: String, value: String)] {
    guard let queryItems = URLComponents(string: self.path)?.queryItems else {
      return []
    }
    return queryItems.map { return (key: $0.name, value: $0.value ?? "") }
  }
}
