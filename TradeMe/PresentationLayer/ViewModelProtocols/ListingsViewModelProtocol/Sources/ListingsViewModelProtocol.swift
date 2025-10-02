//
//  ListingsViewModelProtocol.swift
//  ListingsViewModelProtocol
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import Foundation

@MainActor
public protocol ListingsViewModelProtocol: Sendable, ObservableObject {
	var listingItems: [ListingsItemModel] { get set }
	
	func get() async
}
