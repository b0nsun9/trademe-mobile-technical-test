//
//  DiscoverApp.swift
//  DiscoverDemo
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import Foundation
import SwiftUI

import Discover
import ListingsViewModel
import ListingsEntity
import ListingsRepository

@main
struct DiscoverApp: App {
	var body: some Scene {
		WindowGroup {
			NavigationStack {
				DiscoverView(viewModel: ListingsViewModel(entity: ListingEntity(repository: ListingRepository())))
			}
		}
	}
}
