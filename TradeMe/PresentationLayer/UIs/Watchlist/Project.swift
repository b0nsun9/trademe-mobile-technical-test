import ProjectDescription
import ProjectDescriptionHelpers
import ModularPlugin

let tradeMe = TradeMe(project: PresentationLayer.UIs.Watchlist)

let target = tradeMe.target(
  projects:
    [
      
    ],
  externalPackages:
    [
      
    ]
)

let demo = tradeMe.demo(
  projects: [
    PresentationLayer.UIs.Watchlist,
  ]
)

let project = tradeMe.project(targets: [target, demo])
