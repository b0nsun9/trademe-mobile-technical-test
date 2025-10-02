import ProjectDescription
import ProjectDescriptionHelpers
import ModularPlugin

let tradeMe = TradeMe(project: DomainLayer.EntityProtocols.Listings)

let target = tradeMe.target(
  projects:
    [
      
    ]
)

let project = tradeMe.project(targets: [target])
