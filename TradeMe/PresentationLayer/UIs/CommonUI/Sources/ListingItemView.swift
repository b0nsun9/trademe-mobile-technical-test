//
//  ListingItemView.swift
//  CommonUI
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import SwiftUI

import Resources

public struct ListingItemView: View {
	
	public struct Model: Equatable, Sendable, Identifiable {
		
		public enum Price: Equatable, Sendable {
			case auction(current: Double, buyNow: Double?)
			case classified(asking: Double)
		}
		
		public let id: String
		let location: String
		let title: String
		let imageUrl: URL
		let price: Price
		
		public init(id: String, location: String, title: String, imageUrl: URL, price: Price) {
			self.id = id
			self.location = location
			self.title = title
			self.imageUrl = imageUrl
			self.price = price
		}
	}
	
	private let _model: Model
	
	public init(model: Model) {
		_model = model
	}
	
	public var body: some View {
		HStack(spacing: 0) {
			
			AsyncImage(url: _model.imageUrl) { image in
				image
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 100, height: 100)
					.clipShape(RoundedRectangle(cornerRadius: 10))
					
			} placeholder: {
				ProgressView()
					.frame(width: 100, height: 100)
			}
			
			VStack(alignment: .leading, spacing: 0) {
				
				Text(_model.location)
					.foregroundStyle(R.color.bluffOyster600.color)
					.font(.caption)
				
				Text(_model.title)
					.foregroundStyle(R.color.bluffOyster800.color)
					.fontWeight(.bold)
					.font(.subheadline)
					.multilineTextAlignment(.leading)
					.lineLimit(2)
				
				Spacer()
				
				switch _model.price {
				case .auction(let current, let buyNow):
					
					HStack(spacing: 0) {
						if let buyNow = buyNow {
							
							VStack(alignment: .leading) {
								Text("$\(String(format: "%.2f", current))")
									.foregroundStyle(R.color.bluffOyster800.color)
									.fontWeight(.bold)
									.font(.subheadline)
								
								Text("Reserve met")
									.foregroundStyle(R.color.bluffOyster600.color)
									.font(.caption)
							}
							
							Spacer()
							
							VStack(alignment: .trailing) {
								Text("$\(String(format: "%.2f", buyNow))")
									.foregroundStyle(R.color.bluffOyster800.color)
									.fontWeight(.bold)
									.font(.subheadline)
								
								Text("Buy Now")
									.foregroundStyle(R.color.bluffOyster600.color)
									.font(.caption)
							}
							
						} else {
							
							Spacer()
							
							VStack(alignment: .trailing) {
								Text("$\(String(format: "%.2f", current))")
									.foregroundStyle(R.color.bluffOyster800.color)
									.fontWeight(.bold)
									.font(.subheadline)
								
								Text("Reserve met")
									.foregroundStyle(R.color.bluffOyster600.color)
									.font(.caption)
							}
						}
					}
					
					
					
				case .classified(let asking):
					HStack(spacing: 0) {
						Spacer()
						
						VStack(alignment: .trailing) {
							Text("$\(String(format: "%.2f", asking))")
								.foregroundStyle(R.color.bluffOyster800.color)
								.fontWeight(.bold)
								.font(.subheadline)
							
							Text("Asking price")
								.foregroundStyle(R.color.bluffOyster600.color)
								.font(.caption)
						}
					}
				}
				
			}
			.padding(.horizontal, 10)
		}
	}
}


#Preview {
	ScrollView {
		
		VStack {
			ListingItemView(
				model: .init(
					id: "RandomID",
					location: "Auckland",
					title: "iPhone 15 Pro Max 256GB",
					imageUrl: URL(string: "https://www.apple.com/v/iphone-17-pro/b/images/overview/contrast/iphone_17_pro__dwccrdina7qu_large_2x.jpg")!,
					price: .auction(current: 2000, buyNow: 2300)
				)
			)
			
			ListingItemView(
				model: .init(
					id: "RandomID",
					location: "Auckland",
					title: "iPhone 15 Pro Max 256GB",
					imageUrl: URL(string: "https://www.apple.com/v/iphone-17-pro/b/images/overview/contrast/iphone_17_pro__dwccrdina7qu_large_2x.jpg")!,
					price: .classified(asking: 1900)
				)
			)
		}
	}
}
