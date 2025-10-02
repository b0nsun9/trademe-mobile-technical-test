//
//  Rswift+extensions.swift
//  Resources
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import SwiftUI

import RswiftResources

public extension RswiftResources.ImageResource {
  var image: Image {
    Image(name, bundle: bundle)
  }
}

public extension RswiftResources.ColorResource {
  var color: Color {
    Color(name, bundle: bundle)
  }
}
