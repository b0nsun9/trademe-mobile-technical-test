//
//  ListingItemModel.swift
//  ListingsRepositoryProtocol
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import Foundation

public struct ListingsItemDTO: Equatable, Sendable, Decodable {
	
	public struct Item: Equatable, Sendable, Decodable {
		public let ListingId: Int
		public let Region: String?
		public let Title: String?
		public let PictureHref: String?
		public let IsClassified: Bool?
		public let PriceDisplay: String?
		public let HasBuyNow: Bool?
		public let BuyNowPrice: Double?
	}
	
	public let List: [Item]
}

