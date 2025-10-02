//
//  ListingRepository.swift
//  ListingsRepository
//
//  Created by Bonsung Koo on 02/10/2025.
//  Copyright © 2025 Trade Me. All rights reserved.
//

import Foundation

import ListingsRepositoryProtocol

import Alamofire

public struct ListingRepository: ListingRepositoryProtocol {
	
	public init() {
		
	}
	
	public func get() async -> ListingsItemDTO? {
		
		var httpHeaders: HTTPHeaders = [:]
		httpHeaders.add(.accept("application/json"))
		httpHeaders.add(.contentType("application/x-www-form-urlencoded"))
		httpHeaders.add(.authorization("OAuth oauth_consumer_key=A1AC63F0332A131A78FAC304D007E7D1,oauth_signature_method=PLAINTEXT,oauth_signature=EC7F18B17A062962C6930A8AE88B16C7&"))
		
		let request = AF.request(
			"https://api.tmsandbox.co.nz/v1/listings/latest.json",
			method: .get,
			encoding: URLEncoding.default,
			headers: httpHeaders
		)
			.serializingData()
		
		let response = await request.response
		
		
		if let data = response.data {
			
			do {
				let dto = try JSONDecoder().decode(ListingsItemDTO.self, from: data)
				
				return dto
			} catch(let error) {
				print(error)
				return nil
			}
			
		}
		
		return nil
		
	}
}
