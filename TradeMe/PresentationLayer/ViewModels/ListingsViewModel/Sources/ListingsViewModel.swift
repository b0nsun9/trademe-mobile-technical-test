//
//  ListingsViewModel.swift
//  ListingsViewModel
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import Foundation

import ListingsViewModelProtocol

public final class ListingsViewModel: ListingsViewModelProtocol {
	
	@Published public var listingItems: [ListingsItemModel] = [ListingsItemModel]()
	
	public init() {
		
	}
	
	public func get() async {
		listingItems.append(contentsOf: [
			ListingsItemModel(
				id: UUID().uuidString,
				location: "Auckland",
				title: "iPhone 15 Pro Max 256GB",
				imageUrl: URL(string: "https://www.apple.com/v/iphone-17-pro/b/images/overview/contrast/iphone_17_pro__dwccrdina7qu_large_2x.jpg")!,
				price: .auction(current: 2000, buyNow: 2300)
			),
			ListingsItemModel(
				id: UUID().uuidString,
				location: "Auckland",
				title: "iPhone 15 Pro Max 256GB",
				imageUrl: URL(string: "https://www.apple.com/v/iphone-17-pro/b/images/overview/contrast/iphone_17_pro__dwccrdina7qu_large_2x.jpg")!,
				price: .auction(current: 2000, buyNow: 2300)
			)
		])
		
	}
}
