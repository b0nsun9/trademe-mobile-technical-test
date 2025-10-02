import ProjectDescription
import ProjectDescriptionHelpers
import ModularPlugin

enum Configuration {
  case dev, prod
}

func getDependencies(_ config: Configuration) -> [TargetDependency] {
  
  let projects: [ModularPlugin.Project] = [
    PresentationLayer.UIs.Discover,
    PresentationLayer.UIs.Watchlist,
    PresentationLayer.UIs.MyTradeMe,
    PresentationLayer.ViewModels.Listings,
  ]
  
  return projects.map {
    .project(target: $0.name, path: .relativeToRoot($0.path))
  }
}

// MARK: Dependencies: Prod
let productionDependencies: [TargetDependency] = getDependencies(.prod)


// MARK: Dependencies: Dev
let developmentDependencies: [TargetDependency] = getDependencies(.dev)

// MARK: External Dependencies
let externalDependencies: [TargetDependency] = [
  
]

// MARK: Target - Infomation
let developmentTeam = Environment.developmentTeam.getString(default: "None")
let appVersion = Environment.appVersion.getString(default: "1.0.0")

let aa = Environment.buildNumber.getString(default: "1")

let baseSetting = SettingsDictionary()
  .swiftVersion("6.2")
  .bitcodeEnabled(false)
  .marketingVersion(appVersion)
  .automaticCodeSigning(devTeam: developmentTeam)

let debugSetting = SettingsDictionary()

let releaseSetting = SettingsDictionary()

// MARK: Plist
func getInfoPlist(_ config: Configuration, appVersion: String) -> InfoPlist {
  
  let infoPlist: [String: Plist.Value] = [
    "UILaunchScreen": [
      "UIColorName": "",
      "UIImageName": "",
    ],
    "CFBundleShortVersionString": .string(appVersion),
    "NSHumanReadableCopyright": .string("©2025 Bonsung Koo. All rights reserved."),
    "ITSAppUsesNonExemptEncryption": .boolean(false),
    "UISupportedInterfaceOrientations": .array([.string("UIInterfaceOrientationPortrait")]),
  ]
  
  return .extendingDefault(with: infoPlist)
  
}

// MARK: Target - Prod
let tradeMe = Target.target(
  name: "TradeMe",
  destinations: [.iPhone],
  product: .app,
  bundleId: "me.bonsung.TradeMe",
  deploymentTargets: .iOS("16.4"),
  infoPlist: getInfoPlist(.prod, appVersion: appVersion),
  sources: ["Sources/Commons/**", "Sources/Prod/**"],
  resources: .resources(
    [
      "Resources/Localise/**",
      .glob(
        pattern: .relativeToManifest("Resources/Prod/**"),
        excluding: [.relativeToManifest("Resources/Prod/.gitkeep")]
      ),
    ],
    privacyManifest: .default
  ),
  dependencies: productionDependencies + externalDependencies,
  settings: Settings.settings(
    base: baseSetting,
    debug: debugSetting,
    release: releaseSetting,
    defaultSettings: .recommended
  )
)

// MARK: Target - Dev
let tradeMeDev = Target.target(
  name: "TradeMeDev",
  destinations: [.iPhone],
  product: .app,
  bundleId: "me.bonsung.TradeMe.development",
  deploymentTargets: .iOS("16.4"),
  infoPlist: getInfoPlist(.dev, appVersion: appVersion),
  sources: ["Sources/Commons/**", "Sources/Dev/**"],
  resources: .resources(
    [
      "Resources/Localise/**",
      .glob(
        pattern: .relativeToManifest("Resources/Dev/**"),
        excluding: [.relativeToManifest("Resources/Dev/.gitkeep")]
      ),
    ],
    privacyManifest: .default
  ),
  dependencies: developmentDependencies + externalDependencies,
  settings: Settings.settings(
    base: baseSetting,
    debug: debugSetting,
    release: releaseSetting,
    defaultSettings: .recommended
  )
)

// MARK: Schemes - Infomation
let schemeArguments: Arguments = .arguments(
  environmentVariables: ["OS_ACTIVITY_MODE": "disable"],
  launchArguments: []
)

// MARK: Schemes
let schemes: [Scheme] = [
  .scheme(
    name: "TradeMe",
    shared: true,
    hidden: false,
    buildAction: .buildAction(
      targets: [TargetReference(stringLiteral: "TradeMe")]
    ),
    testAction: nil,
    runAction: RunAction.runAction(
      configuration: ProjectDescription.ConfigurationName(stringLiteral: "debug"),
      executable: TargetReference(stringLiteral: "TradeMe"),
      arguments: schemeArguments
    ),
    archiveAction: ArchiveAction.archiveAction(
      configuration: ProjectDescription.ConfigurationName(stringLiteral: "release")
    ),
    profileAction: nil,
    analyzeAction: nil
  ),
  .scheme(
    name: "TradeMeDev",
    shared: true,
    hidden: false,
    buildAction: .buildAction(
      targets: [TargetReference(stringLiteral: "TradeMeDev")]
    ),
    testAction: nil,
    runAction: RunAction.runAction(
      configuration: ProjectDescription.ConfigurationName(stringLiteral: "debug"),
      executable: TargetReference(stringLiteral: "TradeMeDev"),
      arguments: schemeArguments
    ),
    archiveAction: ArchiveAction.archiveAction(
      configuration: ProjectDescription.ConfigurationName(stringLiteral: "release")
    ),
    profileAction: nil,
    analyzeAction: nil
  )
]

// MARK: Project
let project = Project(
  name: "Applications",
  organizationName: "Trade Me",
  options: Project.Options.options(
    automaticSchemesOptions: .disabled,
    developmentRegion: "en",
    disableBundleAccessors: true,
    disableShowEnvironmentVarsInScriptPhases: true,
    disableSynthesizedResourceAccessors: true,
    textSettings: .textSettings(usesTabs: true, indentWidth: 2, tabWidth: 2, wrapsLines: true),
    xcodeProjectName: "Applications"
  ),
  packages: Packages.all,
  settings:
    Settings.settings(
      configurations:
        [
          .debug(name: "debug"),
          .release(name: "release")
        ]
    ),
  targets: [
    tradeMe,
    tradeMeDev
  ],
  schemes: schemes,
  fileHeaderTemplate: nil,
  resourceSynthesizers: []
)
