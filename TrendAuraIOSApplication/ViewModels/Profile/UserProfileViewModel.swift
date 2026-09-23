//  UserProfileViewModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 02/09/26.

import Foundation

final class UserProfileViewModel {
    
    private(set) var profile : UserProfile?
    
    var onLoadingChanged : ((Bool)->Void)?
    var onError : ((String)->Void)?
    var onProfileLoaded : (()->Void)?
    
    private(set) var isLoading = false {
        didSet {
            onLoadingChanged?(isLoading)
        }
    }
    
    func fetchProfile(){
        
        isLoading = true
        
        Task {
            do{
                let response = try await ProfileService.shared.getProfile()
                self.profile = response.data
                isLoading = false
                onProfileLoaded?()
            }catch{
                isLoading = false
                onError?(error.localizedDescription)
            }
        }
        
    }
    
    
    
    private(set) var cartReels: [FavouriteReelItem] = []   
       var onCartLoaded: (() -> Void)?
    
    func fetchCartReels() {
        Task {
            do {
                let response = try await ExploreService.shared.getFavouriteReels()
                self.cartReels = response.data
                self.onCartLoaded?()
            } catch {
                self.onError?(error.localizedDescription)
            }
        }
    }
    
    func removeFromCart(reelId: Int, completion: @escaping (Bool, String) -> Void) {
        Task {
            do {
                let response = try await ExploreService.shared.removeFromCart(reelId: String(reelId))
                self.cartReels.removeAll { $0.reelId == reelId }
                completion(true, response.message)
            } catch {
                completion(false, error.localizedDescription)
            }
        }
    }
}
