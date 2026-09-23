//  SignUpViewModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 29/08/26.

import Foundation

final class SignUpViewModel {
    
    var name = ""
    var email = ""
    var password = ""
    var confirmPassword = ""
    var isTermsAccepted = false
    
    var onLoadingChnaged : ((Bool)->Void)?
    var onOTPSent : (()->Void)?
    var onError : ((String)->Void)?
    
    private(set) var isLoading = false{
        didSet {onLoadingChnaged?(isLoading)}
    }
    
    func validate() -> String? {
        guard !name.isBlank() else { return "Please enter name." }
        guard name.isValidName() else { return "Name must be at least 3 characters." }
        guard !email.isBlank() else { return "Please enter your email." }
        guard email.isValidEmail() else { return "Please enter a valid email address." }
        guard !password.isBlank() else { return "Please enter password." }
        guard password.isValidPassword() else { return "Password must be at least 8 characters." }
        guard !confirmPassword.isBlank() else { return "Please confirm your password." }
        guard password == confirmPassword else { return "Passwords do not match." }
        guard isTermsAccepted else { return "Please accept Terms & Conditions." }
        return nil

    }
    
    func signUpTapped() {
        if let errorMessage = validate() {
            onError?(errorMessage)
            return
        }
        
        isLoading = true
        
        Task {
            do {
                _ = try await AuthService.shared.sendOTP(email: email)
                isLoading = false
                onOTPSent?()
                
            }catch{
                isLoading = false
                onError?(error.localizedDescription)
            }
        }
        
    }
}
