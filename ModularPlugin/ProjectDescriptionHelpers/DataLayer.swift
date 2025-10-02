import Foundation

public enum DataLayer: Project {
  
  public enum Repositories: Project {
    case Listings
  }
  
  public enum RepositoryProtocols: Project {
    case Listings
  }
  
}

public extension DataLayer {
  var name: String {
    return String(describing: self)
  }
  
  var path: String {
    return "\(parent.path)/DataLayer/\(name)"
  }
  
}

public extension DataLayer.Repositories {
  var name: String {
    return "\(String(describing: self))Repository"
  }
  
  var path: String {
    return "\(parent.path)/DataLayer/Repository/\(name)"
  }
  
}

public extension DataLayer.RepositoryProtocols {
  var name: String {
    return "\(String(describing: self))RepositoryProtocol"
  }
  
  var path: String {
    return "\(parent.path)/DataLayer/RepositoryProtocols/\(name)"
  }
  
}
