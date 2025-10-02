import Foundation

public enum PresentationLayer: Project {
  public enum ViewModels: Project {
    case Listings
  }
  
  public enum ViewModelProtocols: Project {
    case Listings
  }
  
  public enum UIs: Project {
    case CommonUI
    case Resources
    case Discover
    case Watchlist
    case MyTradeMe
  }
}

public extension PresentationLayer {
  var name: String {
    return String(describing: self)
  }
  
  var path: String {
    return "\(parent.path)/PresentationLayer/\(name)"
  }
  
}

public extension PresentationLayer.UIs {
  var name: String {
    return String(describing: self)
  }
  
  var path: String {
    return "\(parent.path)/PresentationLayer/UIs/\(name)"
  }

}

public extension PresentationLayer.ViewModels {
  var name: String {
    return "\(String(describing: self))ViewModel"
  }
  
  var path: String {
    return "\(parent.path)/PresentationLayer/ViewModels/\(name)"
  }
}

public extension PresentationLayer.ViewModelProtocols {
  var name: String {
    return "\(String(describing: self))ViewModelProtocol"
  }
  
  var path: String {
    return "\(parent.path)/PresentationLayer/ViewModelProtocols/\(name)"
  }
}
