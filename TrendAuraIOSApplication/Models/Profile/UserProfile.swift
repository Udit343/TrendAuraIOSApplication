//  UserProfile.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 02/09/26.

import Foundation

struct UserProfileResponse: Decodable {
    let message: String
    let data: UserProfile
}

struct UserProfile: Decodable {
    let userId: String
    let name: String
    let emailId: String
    let countryCode: String
    let phoneNumber: String
    let profilePic: String
    let userName: String
    let about: String
    let country: String
    let state: String
    let address: String
    let city: String
    let whatsappNumber: String
    let contactEmail: String
    let webLink: String
    let facebookLink: String
    let youtubeLink: String
    let twitterLink: String
    let instagramLink: String
    let tikTokLink: String
    let linkedinLink: String
    let googleMap: String
    let gender: String
    let dob: String
    let additionalLink: [AdditionalLink]
    let pinterestLink: String
    let totalLikes: Int
    let totalFollowers: Int
    let totalFollowing: Int
    let totalReelCart: Int

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name
        case emailId = "email_id"
        case countryCode = "country_code"
        case phoneNumber = "phone_number"
        case profilePic = "profile_pic"
        case userName = "user_name"
        case about
        case country
        case state
        case address
        case city
        case whatsappNumber = "whatsapp_number"
        case contactEmail = "contact_email"
        case webLink = "web_link"
        case facebookLink = "facebook_link"
        case youtubeLink = "youtube_link"
        case twitterLink = "twitter_link"
        case instagramLink = "instagram_link"
        case tikTokLink = "tik_tok_link"
        case linkedinLink = "linkedin_link"
        case googleMap = "google_map"
        case gender
        case dob
        case additionalLink = "additional_link"
        case pinterestLink = "pinterest_link"
        case totalLikes = "total_likes"
        case totalFollowers = "total_followers"
        case totalFollowing = "total_following"
        case totalReelCart = "total_reel_cart"
    }
}
