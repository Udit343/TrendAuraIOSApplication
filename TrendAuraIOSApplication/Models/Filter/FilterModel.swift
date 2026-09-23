//  FilterModel.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 08/09/26.


import Foundation

struct FilterRequest: Encodable {
    var mostLike : Bool = false
    var mostShare : Bool = false
    var mostVisit : Bool  = false
    var mostAddToCart : Bool  = false
    var anyTime : Bool  = false
    var today : Bool  = false
    var thisWeek : Bool  = false
    var thisMonth : Bool  = false
    var anyDuration : Bool  = false
    var under30Seconds : Bool  = false
    var under60Seconds : Bool  = false
    var over60Seconds : Bool  = false
    var discount : Bool  = false
    var maxPrice: Int?
    var categories: [String]?
    var address: String?

    enum CodingKeys: String, CodingKey {
        case mostLike = "most_like"
        case mostShare = "most_share"
        case mostVisit = "most_visit"
        case mostAddToCart = "most_add_to_cart"
        case anyTime = "any_time"
        case today
        case thisWeek = "this_week"
        case thisMonth = "this_month"
        case anyDuration = "any_duration"
        case under30Seconds = "under_30_seconds"
        case under60Seconds = "under_60_seconds"
        case over60Seconds = "over_60_seconds"
        case discount
        case maxPrice = "max_price"
        case categories
        case address
    }
}

//Reuses the exact same reel shape already have
struct FilterResponse: Decodable {
    let message: String
    let data: [ReelItem]
}
