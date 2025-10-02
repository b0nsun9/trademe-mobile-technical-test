import ProjectDescription
import ProjectDescriptionHelpers
import ModularPlugin

let tradeMe = TradeMe(project: PresentationLayer.UIs.MyTradeMe)

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
    PresentationLayer.UIs.MyTradeMe,
  ]
)

let project = tradeMe.project(targets: [target, demo])
