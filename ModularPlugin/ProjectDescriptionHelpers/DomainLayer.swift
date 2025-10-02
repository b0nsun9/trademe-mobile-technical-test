import Foundation

public enum DomainLayer: Project {
  public enum Entities: Project {
    case Listings
  }
  
  public enum EntityProtocols: Project {
    case Listings
  }
}

public extension DomainLayer {
  var name: String {
    return String(describing: self)
  }
  
  var path: String {
    return "\(parent.path)/DomainLayer/\(name)"
  }
}

public extension DomainLayer.Entities {
  var name: String {
    return "\(String(describing: self))Entity"
  }
  
  var path: String {
    return "\(parent.path)/DomainLayer/Entities/\(name)"
  }
}

public extension DomainLayer.EntityProtocols {
  var name: String {
    return "\(String(describing: self))EntityProtocol"
  }
  
  var path: String {
    return "\(parent.path)/DomainLayer/EntityProtocols/\(name)"
  }
}
