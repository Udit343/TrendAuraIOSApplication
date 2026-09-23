//  BlockedUserViewModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 11/09/26.

import Foundation
import UIKit

final class BlockedUserViewModel {
    
    var onError : ((String)->Void)?
    var onLoadingChanged : ((Bool)->Void)?
    var onUserLoaded : (()->Void)?
    
    private(set) var Users : [BlockedUser] = []
    
    
    private(set) var isLoading = false {
        didSet {
            onLoadingChanged?(isLoading)
        }
    }
    
    func fetchAllUser(){
        isLoading = true
        Task {
            do{
                let response = try await ProfileService.shared.getAllUsers()
                self.Users = response.data.map { $0.toBlockableUser() }
                isLoading = false
                onUserLoaded?()
            }catch{
                isLoading = false
                onError?(error.localizedDescription)
            }
        }
    }
    
    func toggleBlock(at index: Int, completion: @escaping (Bool) -> Void) {
        guard index < Users.count else { completion(false); return }
        
        let user = Users[index]
        let userIdString = String(user.blockedTo)
        
        Task {
            do {
                let message: String
                if user.isBlocked {
                    
                    let response = try await ProfileService.shared.userUnBlocked(userIdString)
                    message = response.message
                } else {

                    let response = try await ProfileService.shared.userBlocked(userIdString)
                    message = response.message
                }
                self.Users[index].isBlocked.toggle()
                print(message)
                completion(true)
            } catch {
                self.onError?(error.localizedDescription)
                completion(false)
            }
        }
    }
}
