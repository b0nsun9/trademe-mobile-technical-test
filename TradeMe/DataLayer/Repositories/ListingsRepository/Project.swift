import ProjectDescription
import ProjectDescriptionHelpers
import ModularPlugin

let tradeMe = TradeMe(project: DataLayer.Repositories.Listings)

let target = tradeMe.target(
  projects:
    [
      DataLayer.RepositoryProtocols.Listings,
      
    ],
  externalPackages:
    [
      ExternalPackages.DataLayer.Alamofire,
    ]
)

let project = tradeMe.project(targets: [target])
