//
//  TradeMeAppView.swift
//  Applications
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import SwiftUI

import Resources

import Discover
import Watchlist
import MyTradeMe

import ListingsViewModel
import ListingsEntity
import ListingsRepository

import ListingsViewModel

public struct TradeMeAppView: View {
	
	enum Tab {
		case discover
		case watchlist
		case myTradeMe
	}
	
	@State private var _selectedTab: Tab = .discover
	
	public var body: some View {
		TabView {
			
			NavigationStack {
				DiscoverView(
					viewModel: ListingsViewModel(
						entity: ListingEntity(
							repository: ListingRepository()
						)
					)
				)
			}
			.tabItem {
				
				Label {
					Text("Discover")
				} icon: {
					R.image.search.image
						.foregroundStyle(R.color.tasman500.color)
				}
				
			}
			.tag(Tab.discover)
			
			
			NavigationStack {
				WatchlistView()
			}
			.tabItem {
				
				Label {
					Text("Watchlist")
				} icon: {
					R.image.watchlist.image
						.foregroundStyle(R.color.tasman500.color)
				}
				
			}
			.tag(Tab.watchlist)
			
			NavigationStack {
				MyTradeMeView()
			}
			.tabItem {
				
				Label {
					Text("My Trade Me")
				} icon: {
					R.image.profile16.image
						.foregroundStyle(R.color.tasman500.color)
				}
				
			}
			.tag(Tab.myTradeMe)
		}
	}
}
