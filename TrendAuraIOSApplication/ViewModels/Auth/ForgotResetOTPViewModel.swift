
//  ForgotResetOTP.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 01/09/26.

import Foundation

final class ForgotResetOTPViewModel{
    
    var email = ""
    var otpVlaue = ""
    
    var onLoadingChanged : ((Bool)->Void)?
    var onError : ((String)->Void)?
    var onOTPVerified : (()->Void)?
    
    private(set) var isLoading = false {
        didSet{
            onLoadingChanged?(isLoading)
        }
    }
    
    func validate() -> String? {
        
        guard !otpVlaue.isEmpty else {
            return "Please enter OTP"
        }
        
        guard otpVlaue.count == 6 else {
            return "Please enter exact same OTP code"
        }
        
//        guard otpVlaue.allSatisfy({ $0.isNumber }) else {
//            return "OTP must contain only numbers"
//        }
        
        guard Int(otpVlaue) != nil else {return "OTP must contin only number"}
        
        return nil
    }
    
    func ContinueTapped(otp : String){
        
        otpVlaue = otp
       
        if let errorMessage = validate(){
            onError?(errorMessage)
            return
        }
        
        guard let otpNumber = Int(otpVlaue) else {
             return
        }
        
        isLoading  = true
        
        Task {
            do{
               
                _ = try await AuthService.shared.ForgotVerifyOTP(email: email, otp: otpNumber)
                isLoading = false
                onOTPVerified?()
    
            }catch {
                isLoading = false
                onError?(error.localizedDescription)
            }
        }
    }
    
    func resendTapped(){
         
        Task{
            do{
                _ = try await AuthService.shared.ForgotSendOTP(email: email)
            }catch{
                onError?(error.localizedDescription)
            }
        }
       
    }
    
    
}
