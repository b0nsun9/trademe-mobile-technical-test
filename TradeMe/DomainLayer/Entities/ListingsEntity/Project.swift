import ProjectDescription
import ProjectDescriptionHelpers
import ModularPlugin

let tradeMe = TradeMe(project: DomainLayer.Entities.Listings)

let target = tradeMe.target(
  projects:
    [
      DomainLayer.EntityProtocols.Listings,
      DataLayer.RepositoryProtocols.Listings,
    ]
)

let project = tradeMe.project(targets: [target])
