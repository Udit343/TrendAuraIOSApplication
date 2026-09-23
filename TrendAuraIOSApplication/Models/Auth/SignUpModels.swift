
//  SignUpModels.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 24/08/26.

struct signUpRequest : Encodable{
    let email : String
    let name : String
    let password : String
    let timeOffset: String

    enum CodingKeys : String, CodingKey{
         case name,password
         case email = "email_id"
         case timeOffset = "time_offset"
    }
    
}

struct signUpResponse : Decodable{
    let message : String
    let userData : [SignUpUser]
    
}


struct SignUpUser : Decodable {
    
        let userId: Int
        let emailId: String
        let name: String
        let userName: String
        let authKey: String
        let timeOffset: String
        let gender: String?
        let dob: String?

        enum CodingKeys: String, CodingKey {
            case userId = "user_id"
            case emailId = "email_id"
            case name
            case userName = "user_name"
            case authKey = "auth_key"
            case timeOffset = "time_offset"
            case gender
            case dob
        }
}


struct APIErrorResponse : Decodable{
    let message : String
}






