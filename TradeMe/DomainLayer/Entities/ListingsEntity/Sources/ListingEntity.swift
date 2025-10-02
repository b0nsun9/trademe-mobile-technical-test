//
//  ListingEntity.swift
//  ListingsEntity
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import Foundation

import ListingsEntityProtocol
import ListingsRepositoryProtocol

public actor ListingEntity<Repo: ListingRepositoryProtocol>: ListingsEntityProtocol {
	
	private let _repository: Repo
	
	public init (repository: Repo) {
		_repository = repository
	}
	
	public func getItems() async -> [ListingsItemEntity] {
		if let items = await _repository.get() {
			return mapData(dto: items)
		} else {
			return []
		}
	}
	
	private func convertPrice(_ item: Repo.DTO.Item) -> ListingsItemEntity.Price {
		if let isClassified = item.IsClassified, isClassified {
			return .classified(asking: item.PriceDisplay ?? "-0.00")
		} else {
			if let hasBuyNow = item.HasBuyNow, hasBuyNow {
				if let buyNowPrice = item.BuyNowPrice {
					return .auction(current: item.PriceDisplay ?? "-0.00", buyNow: "\(buyNowPrice)")
				} else {
					return .auction(current: item.PriceDisplay ?? "-0.00", buyNow: "-0.00")
				}
			} else {
				return .auction(current: item.PriceDisplay ?? "-0.00", buyNow: nil)
			}
		}
	}
	
	private func mapData(dto: Repo.DTO) -> [ListingsItemEntity] {
		
		return dto.List.map { dtoItem in
			
			let imageUrl = URL(string: dtoItem.PictureHref ?? "https://play-lh.googleusercontent.com/CyY5bOcCjbbFJUcMvO46c6BDat9AEjWb5ye5mdqZ97Ra05oX3l1PSyLQgDo0ozd5TfcU=w480-h960")
			
			let price = convertPrice(dtoItem)
			
			return ListingsItemEntity(
				id: String(describing: dtoItem.ListingId),
				location: dtoItem.Region ?? "Unknown",
				title: dtoItem.Title ?? "Unknown",
				imageUrl: imageUrl,
				price: price
			)
		}
	}
}
