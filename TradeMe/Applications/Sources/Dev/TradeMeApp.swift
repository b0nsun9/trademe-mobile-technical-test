//
//  TradeMeApp.swift
//  Applications
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import SwiftUI

@main
struct TradeMeApp: App {
	
	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
	
	init() { }
	
	var body: some Scene {
		WindowGroup {
			
			TradeMeAppView()
			
		}
	}
}
