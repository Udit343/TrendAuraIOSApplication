//  ForgotPasswordViewModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 01/09/26.

import Foundation

final class ForgotPasswordViewModel {

    var email = ""
    
    var onLoadingChnaged : ((Bool)->Void)?
    var onOTPSend : (()->Void)?
    var onError : ((String)->Void)?
    
    private(set) var isLoading = false {
        didSet{onLoadingChnaged?(isLoading)}
    }
    
    func validate() ->String? {
        guard !email.isBlank() else { return "Please enter your email"}
        guard email.isValidEmail() else { return "Please enter valid email Address"}
        return nil
    }
    
    
    func sendOTPTapped(){
        if let errorMessage = validate() {
            onError?(errorMessage)
            return
        }
        
        isLoading = true
        
        Task {
            do{
                _ = try await AuthService.shared.ForgotSendOTP(email: email)
                isLoading = false
                onOTPSend?()
            }catch {
                isLoading = false
                onError?(error.localizedDescription)
            }
        }
    }
}
