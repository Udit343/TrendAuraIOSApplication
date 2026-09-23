//  CodeVerificationViewModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 31/08/26.


import Foundation

final class CodeVerificationViewModel {
      
    var  name = ""
    var  email = ""
    var  password = ""
    
    var onLoadingChnaged : ((Bool)->Void)?
    var onSignUpSuccess : (()->Void)?
    var onError : ((String)->Void)?
    
    private(set) var isLoading = false {
        didSet {onLoadingChnaged?(isLoading)}
    }
    
    func continueTapped(otp : Int){
    
        isLoading = true
        
        Task{
            do{
                _ = try await AuthService.shared.VerifyOTP(email: email, otp: otp)
                
                _ = try await AuthService.shared.signUp(name: name, email: email, password: password)
                
                isLoading = false
                
                onSignUpSuccess?()
                
            }catch{
                isLoading = false
                onError?(error.localizedDescription)
            }
        }
    }
    
    func resendTapped(){
        Task{
            do{
                _ = try await AuthService.shared.sendOTP(email: email)
                
            }catch{
                onError?(error.localizedDescription)
            }
        }
    }
    
    
}

