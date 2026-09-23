//  UpdateProfile.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 02/09/26.

import Foundation

struct AdditionalLink: Codable {
    let link: String
}

struct UpdateProfileRequest: Encodable {
    let name: String
    let userName: String
    let about: String
    let countryCode: String
    let phoneNumber: String
    let country: String
    let state: String
    let address: String
    let city: String
    let whatsappNumber: String
    let contactEmail: String
    let facebookLink: String
    let youtubeLink: String
    let twitterLink: String
    let instagramLink: String
    let tikTokLink: String
    let linkedinLink: String
    let pinterestLink: String
    let googleMap: String
    let profilePic: String
    let gender: String
    let dob: String
    let webLink: String
    let additionalLink: [AdditionalLink]

    enum CodingKeys: String, CodingKey {
        case name
        case userName = "user_name"
        case about
        case countryCode = "country_code"
        case phoneNumber = "phone_number"
        case country
        case state
        case address
        case city
        case whatsappNumber = "whatsapp_number"
        case contactEmail = "contact_email"
        case facebookLink = "facebook_link"
        case youtubeLink = "youtube_link"
        case twitterLink = "twitter_link"
        case instagramLink = "instagram_link"
        case tikTokLink = "tik_tok_link"
        case linkedinLink = "linkedin_link"
        case pinterestLink = "pinterest_link"
        case googleMap = "google_map"
        case profilePic = "profile_pic"
        case gender
        case dob
        case webLink = "web_link"
        case additionalLink = "additional_link"
    }
}

struct UpdateProfileResponse: Decodable {
    let status: Int
    let message: String
}

