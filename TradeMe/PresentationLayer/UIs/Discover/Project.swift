import ProjectDescription
import ProjectDescriptionHelpers
import ModularPlugin

let tradeMe = TradeMe(project: PresentationLayer.UIs.Discover)

let target = tradeMe.target(
  projects:
    [
      PresentationLayer.UIs.CommonUI,
      PresentationLayer.ViewModelProtocols.Listings,
    ],
  externalPackages:
    [
      
    ]
)

let demo = tradeMe.demo(
  projects: [
    PresentationLayer.UIs.Discover,
    PresentationLayer.ViewModels.Listings,
  ]
)

let project = tradeMe.project(targets: [target, demo])
