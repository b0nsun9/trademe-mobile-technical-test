import ProjectDescription

let tuist = Tuist(
  project: .tuist(
    swiftVersion: "6.2",
    plugins: [
      .local(path: .relativeToRoot("ModularPlugin"))
    ]
  )
)
