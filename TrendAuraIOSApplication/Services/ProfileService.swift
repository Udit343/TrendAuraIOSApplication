//  ProfileService.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 02/09/26.

final class ProfileService{
    
    static let shared = ProfileService()
    private init() { }
    
    func getProfile()async throws -> UserProfileResponse {
        return try await APIClient.shared.get(.getProfile, reponseType: UserProfileResponse.self)
    }
    
    func updateProfile(_ request : UpdateProfileRequest)async throws -> UpdateProfileResponse {
        return try await APIClient.shared.post(
            .updateProfile,
            body: request,
            responseType: UpdateProfileResponse.self,
            requiresAuth: true
        )
    }
    
    func getAllUsers() async throws -> SearchUserResponse {
            let body = SearchRequest(searchType: "user", searchName: "an", pageNo: "1")
            return try await APIClient.shared.post(.search, body: body, responseType: SearchUserResponse.self, requiresAuth: true)
        }

    
    func userBlocked(_ userId : String)async throws -> UserBlockResponse {
        return try await APIClient.shared.post(.userBlocked, body: userId, responseType: UserBlockResponse.self, requiresAuth: true)
    }
    
    func userUnBlocked(_ userId : String) async throws -> UserUnBlockedResponse {
        return try await APIClient.shared.post(.userUnBlocked, body: userId, responseType: UserUnBlockedResponse.self, requiresAuth: true)
    }
    
    func getBlockedUser() async throws -> BlockedUserResponse {
        return try await APIClient.shared.get(.getBlockedUser, reponseType: BlockedUserResponse.self, requiresAuth: true)
    }
    
}
