import Foundation

enum TradeMe: Workspace {
  
  case TradeMe
  
  var name: String {
    switch self {
    case .TradeMe:
      return "TradeMe"
    }
  }
  
  var path: String {
    return "TradeMe"
  }
  
}
