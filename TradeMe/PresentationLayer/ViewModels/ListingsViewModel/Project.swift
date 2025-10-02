import ProjectDescription
import ProjectDescriptionHelpers
import ModularPlugin

let tradeMe = TradeMe(project: PresentationLayer.ViewModels.Listings)

let target = tradeMe.target(
  projects:
    [
      PresentationLayer.ViewModelProtocols.Listings,
      
    ]
)

let tests = tradeMe.test(
  projects: [
    PresentationLayer.ViewModels.Listings,
  ]
)

let project = tradeMe.project(targets: [target, tests])
