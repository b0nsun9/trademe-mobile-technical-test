//
//  DiscoverView.swift
//  Discover
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import CommonUI
import Resources
import SwiftUI

import ListingsViewModelProtocol

public struct DiscoverView<VM: ListingsViewModelProtocol>: View {
	
	@StateObject private var _viewModel: VM
	
	enum Alerts: Equatable, Identifiable {
		
		var id: String {
			return String(describing: self)
		}
		
		case search
		case cart
		case item(title: String)
	}
	
	@State private var _alert: Alerts?
	
	public init(viewModel: VM) {
		__viewModel = StateObject(wrappedValue: viewModel)
	}
	
	private func convertPrice(_ price: Price) -> ListingItemView.Model.Price {
		switch price {
		case .auction(let current, let buyNow):
			return .auction(current: current, buyNow: buyNow)
		case .classified(let asking):
			return .classified(asking: asking)
		}
	}
	
	public var body: some View {
		ScrollView {
			LazyVStack(spacing: 10) {
				
				ForEach(_viewModel.listingItems) { listingItem in
					
					Button {
						_alert = .item(title: listingItem.title)
					} label: {
						ListingItemView(
							model: .init(
								id: listingItem.id,
								location: listingItem.location,
								title: listingItem.title,
								imageUrl: listingItem.imageUrl,
								price: convertPrice(listingItem.price)
							)
						)
					}
					
					if let lastItem = _viewModel.listingItems.last,
						 listingItem.id != lastItem.id {
						Divider()
					}
					
				}
				
			}
		}
		.navigationTitle("Browse")
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			
			ToolbarItem(placement: .topBarTrailing) {
				Button {
					_alert = .search
				} label: {
					R.image.search.image
				}
			}
			
			ToolbarItem(placement: .topBarTrailing) {
				Button {
					_alert = .cart
				} label: {
					R.image.cart.image
				}
			}
		}
		.alert(item: $_alert, content: { alert in
			
			switch alert {
			case .cart:
				Alert(title: Text("Cart button tapped!"))
			case .search:
				Alert(title: Text("Search button tapped!"))
			case .item(let title):
				Alert(title: Text("\(title) tapped!"))
			}
			
		})
		.task {
			await _viewModel.get()
		}
		
	}
}
