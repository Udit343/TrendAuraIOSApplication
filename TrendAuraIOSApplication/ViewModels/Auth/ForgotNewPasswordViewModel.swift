//  ForgotNewPasswordViewModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 01/09/26.

import Foundation

final class ForgotNewPasswordViewModel {
    
    var newPassword = ""
    var confirmPassword = ""
    
    var onLoadingChnaged : ((Bool)->Void)?
    var onError : ((String)->Void)?
    var onPasswordChangeSuccess : (()->Void)?
    
    private(set) var isLoading = false {
        didSet {
            onLoadingChnaged?(isLoading)
        }
    }
    
    
    func validate()-> String? {
        guard !newPassword.isEmpty else {return "please enter a newPassword."}
        guard newPassword.isValidPassword() else { return "password Must be atleast 8 character."}
        
        guard !confirmPassword.isEmpty else {return "please confirm your password."}
        guard confirmPassword.isValidPassword() else {return "password must be atleast 8 character."}
        
        guard newPassword == confirmPassword else { return "password do not match. "}
        
        return nil
    }
    
    func continueTapped(){
        if let error = validate() {
            onError?(error)
            return
        }
        
        isLoading = true
        
        Task{
            do{
                
                _ = try await AuthService.shared.ChnagePassword(password: confirmPassword)
                isLoading = false
                onPasswordChangeSuccess?()
                
            }catch{
                isLoading = false
                onError?(error.localizedDescription)
            }
        }
    }
}
