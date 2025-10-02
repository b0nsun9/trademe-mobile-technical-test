import Foundation

public enum Factory: Project {
  public enum Factories: Project {
    case Discover
  }
  public enum FactoryProtocols: Project {
    case Discover
  }
}

public extension Factory {
  var name: String {
    return String(describing: self)
  }
  
  var path: String {
    return "\(parent.path)/Factory/\(name)"
  }

}

public extension Factory.Factories {
  var name: String {
    return "\(String(describing: self))Factory"
  }
  
  var path: String {
    return "\(parent.path)/Factory/Factories/\(name)"
  }

}

public extension Factory.FactoryProtocols {
  var name: String {
    return "\(String(describing: self))FactoryProtocol"
  }
  
  var path: String {
    return "\(parent.path)/Factory/FactoryProtocols/\(name)"
  }

}
