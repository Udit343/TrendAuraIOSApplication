import Foundation

struct ForgotOTPRequest: Encodable {
    let emailId: String

    enum CodingKeys: String, CodingKey {
        case emailId = "email_id"
    }
}

struct ForgotOTPResponse: Decodable {
    let status: Int
    let message: String
    let authKey: String

    enum CodingKeys: String, CodingKey {
        case status
        case message
        case authKey = "auth_key"
    }
}

struct ForgotVerifyRequest: Encodable {
    let emailId: String
    let otp: Int

    enum CodingKeys: String, CodingKey {
        case emailId = "email_id"
        case otp = "otp"
    }
}

struct ForgotVerifyResponse: Decodable {
    let status: Int
    let message: String
    let data: ForgotVerifyData
}

struct ForgotVerifyData: Decodable {
    let authKey: String

    enum CodingKeys: String, CodingKey {
        case authKey = "auth_key"
    }
}

struct NewPasswordRequest: Encodable {
    let password: String

    enum CodingKeys: String, CodingKey {
        case password = "new_password"
    }
}

struct NewPasswordResponse: Decodable {
    let status: Int
    let message: String
}
