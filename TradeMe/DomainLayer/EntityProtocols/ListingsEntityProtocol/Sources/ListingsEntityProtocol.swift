//
//  ListingsEntity.swift
//  ListingsEntityProtocol
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import Foundation

public protocol ListingsEntityProtocol: Sendable where Entity == ListingsItemEntity {
	associatedtype Entity
	func getItems() async -> [Entity]
}
