//  CreateReel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 18/09/26.

import Foundation

final class CreateReel {
    
  static  let shared = CreateReel()
    private init() { }
    
    func getCategory()async throws -> CategoryResponse {
        let response = try await APIClient.shared.get(.getReelCategory, reponseType: CategoryResponse.self)
        return response 
    }
    
    func createReel(_ request : CreateReelRequest) async throws -> creatReelResponse {
        return try await APIClient.shared.post(.createReel, body: request, responseType: creatReelResponse.self, requiresAuth: true)
    }
}
