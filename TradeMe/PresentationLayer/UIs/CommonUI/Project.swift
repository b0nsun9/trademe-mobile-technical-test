import ProjectDescription
import ProjectDescriptionHelpers
import ModularPlugin

let tradeMe = TradeMe(project: PresentationLayer.UIs.CommonUI)

let target = tradeMe.target(
  projects:
    [
      PresentationLayer.UIs.Resources,
    ],
  externalPackages:
    [
      
  ]
)

let project = tradeMe.project(targets: [target])
