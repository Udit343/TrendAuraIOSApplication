//  CreateReel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 18/09/26.
import Foundation

struct CreateReelRequest: Encodable {
    let mediaType: String
    let media: [String]
    let audioUrl: String
    let thumbnailUrl: String
    let title: String
    let discount: String
    let description: String
    let visitLink: String
    let minPrice: String
    let maxPrice: String
    let duration: String
    let tag: [String]
    let category: [String]
    let couponId: String?
    let couponExpiryDate: String?
    
    enum CodingKeys : String , CodingKey {
        case mediaType = "media_type"
        case media
        case audioUrl = "audio_url"
        case thumbnailUrl = "thumbnail_url"
        case title
        case discount
        case description
        case visitLink = "visit_link"
        case minPrice = "min_price"
        case maxPrice = "max_price"
        case duration
        case tag
        case category
        case couponId = "coupon_id"
        case couponExpiryDate = "coupon_expiry_date"
    }
}


struct creatReelResponse : Decodable {
    let message : String
}
