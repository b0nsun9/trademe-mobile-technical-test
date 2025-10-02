import ProjectDescription
import ProjectDescriptionHelpers
import ModularPlugin

let tradeMe = TradeMe(project: DataLayer.RepositoryProtocols.Listings)

let target = tradeMe.target(
  projects:
    [
      
    ]
)

let project = tradeMe.project(targets: [target])
