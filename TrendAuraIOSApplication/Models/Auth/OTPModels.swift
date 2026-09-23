//  OTPModels.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 31/08/26.

import Foundation

//OTP send in response
struct  SendOTPRequest : Encodable {
    let email : String
    
    enum CodingKeys : String, CodingKey {
         case email = "email_id"
    }
}


struct SendOTPResponse : Decodable {
    let message : String

}

//Send OTP for verification
struct VerifyOTPRequest : Encodable {
    let email : String
    let otp : Int
    
    enum CodingKeys : String, CodingKey {
        case email = "email_id"
        case otp
    }
}

struct VerifyOTPResponse : Decodable {
    let message : String
}
