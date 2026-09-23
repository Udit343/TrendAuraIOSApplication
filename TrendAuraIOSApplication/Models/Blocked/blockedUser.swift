//  blockedUser.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 11/09/26.

import Foundation


import Foundation

struct BlockedUserResponse: Decodable {
    let message: String
    let data: [BlockedUser]
}

extension SearchUser {
    
    func toBlockableUser() -> BlockedUser {
        BlockedUser(
            blockedTo: String(userId),
            blockedToName: name,
            userName: userName,
            profilePic: profilePic,
            isBlocked: false
        )
    }
}

struct BlockedUser: Decodable {
    let blockedTo: String
    let blockedToName: String
    let userName: String
    let profilePic: String
    var isBlocked: Bool

    enum CodingKeys: String, CodingKey {
        case blockedTo = "blocked_to"
        case blockedToName = "blocked_to_name"
        case userName = "user_name"
        case profilePic = "profile_pic"
        case isBlocked = "is_Blocked"
    }
}


struct UserBlockedResquest : Encodable {
    let blocked_to : String
}

struct UserBlockResponse : Decodable {
    let message : String
}

struct UserUnBlockedResquest : Encodable {
    let unblock_user_id : String
}

struct UserUnBlockedResponse : Decodable {
    let message : String
}

