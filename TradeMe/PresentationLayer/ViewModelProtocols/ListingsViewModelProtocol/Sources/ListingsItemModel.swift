//
//  ListingsItemProtocol.swift
//  ListingsViewModelProtocol
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import Foundation

public enum Price: Equatable, Sendable {
	case auction(current: Double, buyNow: Double?)
	case classified(asking: Double)
}

public struct ListingsItemModel: Identifiable, Equatable, Sendable {
	public let id: String
	public let location: String
	public let title: String
	public let imageUrl: URL
	public let price: Price
	
	public init(id: String, location: String, title: String, imageUrl: URL, price: Price) {
		self.id = id
		self.location = location
		self.title = title
		self.imageUrl = imageUrl
		self.price = price
	}
}
