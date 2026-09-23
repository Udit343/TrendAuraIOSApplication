//  ExploreData.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 03/09/26.

import Foundation

struct ExploreResponse: Decodable {
    let message: String
    let frequentlyVisited: [ReelItem]
    let newAndNoteworthy: [ReelItem]
    let trendingThisWeek: [ReelItem]
    let topTags: [TagItem]
    let popularStore: [PopularStoreItem]

    enum CodingKeys: String, CodingKey {
        case message
        case frequentlyVisited
        case newAndNoteworthy
        case trendingThisWeek
        case topTags
        case popularStore
    }
}

struct ReelItem: Decodable {
    let userId: Int
    let name: String
    let userName: String
    let reelId: Int
    let categoryId: Int?
    let mediaType: String
    let media: [String]
    let audioUrl: String?
    let thumbnailUrl: String
    let profilePic: String
    let title: String
    let description: String
    let visitLink: String
    let minPrice: String
    let maxPrice: String
    let reelCreatedAt: String?
    let viewsCount: Int
    let totalLikes: Int
    let isFavourite: Int
    let tags: String

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name
        case userName = "user_name"
        case reelId = "reel_id"
        case categoryId = "category_id"
        case mediaType = "media_type"
        case media
        case audioUrl = "audio_url"
        case thumbnailUrl = "thumbnail_url"
        case profilePic = "profile_pic"
        case title
        case description
        case visitLink = "visit_link"
        case minPrice = "min_price"
        case maxPrice = "max_price"
        case reelCreatedAt = "reel_created_at"
        case viewsCount = "views_count"
        case totalLikes = "total_likes"
        case isFavourite = "is_favourite"
        case tags
    }
}

struct TagItem: Decodable {
    let tag: String
    let viewsCount: Int

    enum CodingKeys: String, CodingKey {
        case tag
        case viewsCount = "views_count"
    }
}

struct PopularStoreItem: Decodable {
    let userId: Int
    let name: String
    let userName: String
    let profilePic: String
    let viewsCount: Int
    let totalLikes: Int
    let cartCount: Int

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name
        case userName = "user_name"
        case profilePic = "profile_pic"
        case viewsCount = "views_count"
        case totalLikes = "total_likes"
        case cartCount = "cart_count"
    }
}
