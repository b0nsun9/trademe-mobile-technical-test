//
//  ListingsViewModel.swift
//  ListingsViewModel
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import Foundation

import ListingsViewModelProtocol
import ListingsEntityProtocol

public final class ListingsViewModel<Entity: ListingsEntityProtocol>: ListingsViewModelProtocol {
	
	private let _entity: Entity
	
	@Published public var listingItems: [ListingsItemModel] = [ListingsItemModel]()
	
	public init(entity: Entity) {
		_entity = entity
	}
	
	public func get() async {
		let items = await _entity.getItems()
		
		listingItems = mapData(entities: items)
	}
	
	private func convertPrice(_ price: Entity.Entity.Price) -> ListingsItemModel.Price {
		switch price {
		case .auction(let current, let buyNow):
			return .auction(current: current, buyNow: buyNow)
		case .classified(let asking):
			return .classified(asking: asking)
		}
	}
	
	private func mapData(entities: [Entity.Entity]) -> [ListingsItemModel] {
		return entities.map { entity in
			
			let price = convertPrice(entity.price)
			
			return .init(
				id: entity.id,
				location: entity.location,
				title: entity.title,
				imageUrl: entity.imageUrl,
				price: price
			)
		}
	}
}
