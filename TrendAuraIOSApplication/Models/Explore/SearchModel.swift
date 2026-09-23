
//  SearchModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 07/09/26.

import Foundation

struct SearchRequest: Encodable {
    let searchType: String
    let searchName: String
    let pageNo: String

    enum CodingKeys: String, CodingKey {
        case searchType = "search_type"
        case searchName = "search_name"
        case pageNo = "page_no"
    }
}

struct SearchUserResponse: Decodable {
    let data: [SearchUser]
}

struct SearchUser: Decodable {
    let userId: Int
    let name: String
    let userName: String
    let profilePic: String

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name
        case userName = "user_name"
        case profilePic = "profile_pic"
    }
}

struct SearchPromoResponse: Decodable {
    let data: [ReelItem]   
}

struct SearchHashtagResponse: Decodable {
    let data: [SearchHashtag]
}

struct SearchHashtag: Decodable {
    let tag: String
    let profilePic: String

    enum CodingKeys: String, CodingKey {
        case tag
        case profilePic = "profile_pic"
    }
}



