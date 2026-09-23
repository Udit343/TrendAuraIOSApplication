//  LogInViewModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 01/09/26.

import Foundation

final class LogInViewModel {
    
    var email = ""
    var password = ""
    
    var onLoadingChanged : ((Bool)->Void)?
    var onLogInSuccess : (()-> Void)?
    var onError : ((String)->Void)?
    
    
    private(set) var isLoading = false {
        didSet{onLoadingChanged?(isLoading)}
    }
    
    
    func validate()->String?{
        guard !email.isBlank() else {return "please enter your email"}
        guard email.isValidEmail() else {return "Please enter valid email address"}
        guard !password.isBlank() else { return "please enter your password"}
        guard password.isValidPassword() else {return "password must be atleast 8 character"}
        return nil
    }
    
    
    func logInTapped(){
        if let errorMessage = validate(){
            onError?(errorMessage)
            return
        }
        
        isLoading = true
        
        Task{
            do{
                _ = try await AuthService.shared.SignIn(email: email, password: password)
                
                isLoading = false
                onLogInSuccess?()
            }catch{
                
                isLoading = false
                onError?(error.localizedDescription)
            }
        }
    }
}
