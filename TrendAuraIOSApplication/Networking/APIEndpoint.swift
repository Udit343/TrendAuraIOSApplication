//  APIEndpoint.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 25/08/26.

import Foundation

enum APIENDpoint {
    
    case signUp
    case sendOTP
    case verifyOTP
    case signIn
    case forgotOTP
    case forgotVerifyOTP
    case newPassword
    
    
    case getProfile
    case updateProfile
    
    
    case exploreData
    case search
    case addCart
    case filterReels
    
    case favouriteReels
    case removeFromCart
    case getFavouriteReels
    
    case userBlocked
    case userUnBlocked
    case getBlockedUser
    
    case getReelCategory
    case createReel

    
    static let baseURL = "http://3.20.219.240:3016/btyb_v1/"
    var path : String {
        switch self{
               case .signUp : return  "sign-up-with-email"
               
               case .sendOTP : return  "send-email-verification-otp"
                
               case .verifyOTP : return  "verify-email-otp"
            
               case .signIn  :  return "sign-in-with-email"
            
               case .forgotOTP : return "send-forget-password-otp"
            
               case .forgotVerifyOTP : return "verify-reset-forget-password-otp"
            
               case .newPassword : return "change-password"
            
               case .getProfile : return "get-my-profile"
            
               case .updateProfile : return "update-profile"
            
               case .exploreData : return "get-explore-data"
            
               case .search : return "user-search"
            
               case .addCart : return "add-reel-to-favourite"
            
               case .filterReels : return "get-reel-by-search-filter"
            
               case .favouriteReels : return "add-reel-to-favourite"
            
               case .removeFromCart : return "remove-reel-from-favourite"
            
               case .getFavouriteReels : return "get-all-favourite-reels"
            
               case .userBlocked  : return "block-user"
            
               case .userUnBlocked : return "unblock-user"
            
               case .getBlockedUser : return "get-blocked-users"
            
               case .getReelCategory : return "get-reels-category"
            
               case .createReel : return "create-user-reels"
        }
    }
    
    var url : URL {
        URL( string: APIENDpoint.baseURL + path)!
    }
}
