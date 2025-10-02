//
//  ListingItemModel.swift
//  ListingsEntityProtocol
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import Foundation

public struct ListingsItemEntity: Identifiable, Equatable, Sendable {
	
	public enum Price: Equatable, Sendable {
		case auction(current: String, buyNow: String?)
		case classified(asking: String)
	}
	
	public let id: String
	public let location: String
	public let title: String
	public let imageUrl: URL?
	public let price: Price
	
	public init(id: String, location: String, title: String, imageUrl: URL?, price: Price) {
		self.id = id
		self.location = location
		self.title = title
		self.imageUrl = imageUrl
		self.price = price
	}
}

