//  LogInModels.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 01/09/26.

import Foundation

struct logInRequest: Encodable {
    let email: String
    let password: String

    enum CodingKeys: String, CodingKey {
        case email = "email_id"
        case password
    }
}


struct logInResponse : Decodable {
    let message : String
    let userData : [LogInUser]
}


struct LogInUser : Decodable {
    let userId : Int
    let emailId : String
    let name : String
    let authKey : String
    let gender : String?
    let dob : String?
    
    enum CodingKeys : String, CodingKey {
        case userId = "user_id"
        case emailId  = "email_id"
        case authKey = "auth_key"
        case name
        case gender
        case dob
    }
    
}

