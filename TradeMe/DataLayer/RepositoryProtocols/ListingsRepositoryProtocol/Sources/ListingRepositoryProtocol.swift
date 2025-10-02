//
//  ListingRepositoryProtocol.swift
//  ListingsRepositoryProtocol
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import Foundation

public protocol ListingRepositoryProtocol: Sendable where DTO == ListingsItemDTO {
	associatedtype DTO
	func get() async -> DTO?
}

