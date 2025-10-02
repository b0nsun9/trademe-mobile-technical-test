import ProjectDescription
import Foundation

public struct ExternalPackages {
  
  public struct DataLayer {
    public static var Alamofire: TargetDependency {
      return .package(product: "Alamofire", type: .runtime)
    }
  }
  
}
