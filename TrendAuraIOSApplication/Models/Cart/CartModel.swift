//  CartModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 10/09/26.

import Foundation

struct FavouriteReelsResponse: Decodable {
    let message: String
    let data: [FavouriteReelItem]
}

struct FavouriteReelItem: Decodable {
    let userId: Int
    let name: String
    let remainingMonthLimit: String
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
    let tags: String
    let addFavouriteReelDate: String   
    let totalLikes: Int
    let viewsCount: Int
    let isBlocked: Int

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name
        case remainingMonthLimit = "remaining_month_limit"
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
        case tags
        case addFavouriteReelDate
        case totalLikes = "total_likes"
        case viewsCount = "views_count"
        case isBlocked = "is_blocked"
    }
}
