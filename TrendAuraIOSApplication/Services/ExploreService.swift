//  ExploreService.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 03/09/26.

final class ExploreService {
    
    static let shared = ExploreService()
    
    private init() { }
    
    func getExploreData()async throws -> ExploreResponse{
        return try await APIClient.shared.get(.exploreData, reponseType: ExploreResponse.self)
    }
    
    func searchUsers(query: String, page: Int) async throws -> SearchUserResponse {
            let body = SearchRequest(searchType: "user", searchName: query, pageNo: "\(page)")
            return try await APIClient.shared.post(.search, body: body, responseType: SearchUserResponse.self, requiresAuth: true)
        }

        func searchPromos(query: String, page: Int) async throws -> SearchPromoResponse {
            let body = SearchRequest(searchType: "promo", searchName: query, pageNo: "\(page)")
            return try await APIClient.shared.post(.search, body: body, responseType: SearchPromoResponse.self, requiresAuth: true)
        }

        func searchHashtags(query: String, page: Int) async throws -> SearchHashtagResponse {
            let body = SearchRequest(searchType: "hashtag", searchName: query, pageNo: "\(page)")
            return try await APIClient.shared.post(.search, body: body, responseType: SearchHashtagResponse.self, requiresAuth: true)
        }
    
    
    func addToCart(reelId : String) async throws -> AddToCartResponse{
        let body = AddToCartRequest(reel_id: reelId)
        return try await APIClient.shared.post(.addCart, body: body, responseType: AddToCartResponse.self, requiresAuth: true)
    }
    
    //Filter Reels write here Service logic
    func filterReels(_ filter: FilterRequest) async throws -> FilterResponse {
            return try await APIClient.shared.post(.filterReels, body: filter, responseType: FilterResponse.self, requiresAuth: true)
        }
    
    func getFavouriteReels() async throws -> FavouriteReelsResponse {
            try await APIClient.shared.get(.getFavouriteReels, reponseType: FavouriteReelsResponse.self)
        }

        func addFavouriteReels(reelId: String) async throws -> AddToCartResponse {
            let body = AddToCartRequest(reel_id: reelId)
            return try await APIClient.shared.post(.favouriteReels, body: body, responseType: AddToCartResponse.self, requiresAuth: true)
        }

        func removeFromCart(reelId: String) async throws -> AddToCartResponse {
            let body = AddToCartRequest(reel_id: reelId)
            return try await APIClient.shared.post(.removeFromCart, body: body, responseType: AddToCartResponse.self, requiresAuth: true)
        }
}
