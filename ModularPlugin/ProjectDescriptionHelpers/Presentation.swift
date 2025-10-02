import Foundation

public enum PresentationLayer: Project {
  public enum ViewModels: Project {
    case Discover
  }
  
  public enum ViewModelProtocols: Project {
    case Discover
  }
  
  public enum UIs: Project {
    case CommonUI
    case UIExtensions
    case Resources
    case Discover
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
