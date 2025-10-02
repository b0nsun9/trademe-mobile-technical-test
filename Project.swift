import ProjectDescription

let project = Project(
    name: "TradeMe",
    targets: [
        .target(
            name: "TradeMe",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.TradeMe",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "TradeMe/Sources",
                "TradeMe/Resources",
            ],
            dependencies: []
        ),
        .target(
            name: "TradeMeTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.TradeMeTests",
            infoPlist: .default,
            buildableFolders: [
                "TradeMe/Tests"
            ],
            dependencies: [.target(name: "TradeMe")]
        ),
    ]
)
