//  AuthService.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 29/08/26.


import  Foundation
import FirebaseFirestore

final class AuthService{
    
     static let shared = AuthService()
    private init() {}
    
    private let db = Firestore.firestore()
    
    func signUp(name : String, email : String, password : String)async throws->signUpResponse{
        
        let offset = TimeZone.current.getTimeOffsetString()
        
        let body  = signUpRequest(email:email, name: name, password: password, timeOffset: offset)
        
        let response =  try await APIClient.shared.post(.signUp, body: body, responseType: signUpResponse.self)
        
        if let user = response.userData.first {
            KeychainHelpher.shared.saveToken(user.authKey)
            KeychainHelpher.shared.saveUserId(user.userId)
            
            do {
                try await db.collection("users").document(String(user.userId)).setData([
                                "uid": String(user.userId),
                                "name": user.name], merge: true)
                print("Firestore write succeeded")
                        } catch {
                            print("Failed to save user profile to Firestore:", error)
                        }
                    
        }
        return response
    }
    
    
    
    func sendOTP(email: String) async throws -> SendOTPResponse {
         let body = SendOTPRequest(email: email)
        
        return try await APIClient.shared.post(.sendOTP, body: body, responseType: SendOTPResponse.self)
    }
    
    
    
    func VerifyOTP(email : String, otp : Int) async throws -> VerifyOTPResponse {
        
        let body = VerifyOTPRequest(email: email, otp: otp)
        return try await APIClient.shared.post(.verifyOTP, body: body, responseType: VerifyOTPResponse.self)
        
    }
    
    
    func SignIn(email : String , password : String) async throws -> logInResponse {
        
        let body = logInRequest(email: email, password: password)
        let response = try await APIClient.shared.post(.signIn, body: body, responseType: logInResponse.self)
        
    
        
        if let user = response.userData.first {
            KeychainHelpher.shared.saveToken(user.authKey)
            KeychainHelpher.shared.saveUserId(user.userId)
            await saveUserToFirestore(userId: user.userId, name: user.name)
        }
        return response
    }
    
    private func saveUserToFirestore(userId: Int, name: String) async {
            do {
                try await db.collection("users").document(String(userId)).setData([
                    "uid": String(userId),
                    "name": name
                ], merge: true)
                print("Firestore user saved:", userId)
            } catch {
                print("Firestore user save failed:", error)
            }
        }
    
    
    func ForgotSendOTP(email : String) async throws -> ForgotOTPResponse{
        
        let body = ForgotOTPRequest(emailId: email)
        let response = try await APIClient.shared.post(.forgotOTP, body: body, responseType: ForgotOTPResponse.self)
        
        KeychainHelpher.shared.saveToken(response.authKey)
        return response
    }
    
    
    func ForgotVerifyOTP(email : String , otp : Int) async throws -> ForgotVerifyResponse {
        
        let body = ForgotVerifyRequest(emailId: email, otp: otp)
        let response = try await APIClient.shared.post(.forgotVerifyOTP, body: body, responseType: ForgotVerifyResponse.self)
        
        KeychainHelpher.shared.saveToken(response.data.authKey)
        return response
    }
    
    
    func ChnagePassword(password : String) async throws -> NewPasswordResponse {
        
        let body = NewPasswordRequest(password: password)
        let response = try await APIClient.shared.post(.newPassword, body: body, responseType: NewPasswordResponse.self, requiresAuth: true)
        
        return response
    }
}
