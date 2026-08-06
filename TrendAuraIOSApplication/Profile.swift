//  Profile.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 03/08/26.


import Foundation
import UIKit

struct profileInfo{
    let imageTitle : String
    let title : String
    let subTitle : String
}


let profileInfoData : [profileInfo] = [
    profileInfo(imageTitle: "profile1", title: "Edit Profile", subTitle: "Lorem ipsum is a placeholder text"),
    profileInfo(imageTitle: "shareProfile", title: "Share Profile", subTitle: "Lorem ipsum is a placeholder text"),
    profileInfo(imageTitle: "subscriptionInfo", title: "Subscription Info", subTitle: "Lorem ipsum is a placeholder text"),
    profileInfo(imageTitle: "contactUs", title: "Contact us", subTitle: "Lorem ipsum is a placeholder text"),
    profileInfo(imageTitle: "termsOfService", title: "Terms of Service", subTitle: "Lorem ipsum is a placeholder text"),
    profileInfo(imageTitle: "blockedUser", title: "Blocked User", subTitle: "Lorem ipsum is a placeholder text"),
    profileInfo(imageTitle: "resetPassword", title: "Reset Password", subTitle: "Lorem ipsum is a placeholder text"),
    profileInfo(imageTitle: "lougOut", title: "Lougout", subTitle: "Lorem ipsum is a placeholder text"),
]




//// for personal Profile
struct BasicInfo {
    let namePlaceholder: String
    let usernamePlaceholder: String
}

struct AboutInfo {
    let placeholder: String
}

struct LocationInfo {
    let states: [String]
    let cities: [String]
}

struct GenderInfo {
    let genders: [String]
}

struct DateOfBirthInfo {
    let placeholder: String
}

struct LinkInfo {
    let imageName: String
    let placeholder: String
}

enum ProfileSection: Int, CaseIterable {
    case enterName
    case userName
    case about
    case state
    case city
    case visitLinks
    case gender
    case dateOfBirth
    case terms
    
    var title: String {

            switch self {

            case .enterName:
                return "Enter Name"

            case .userName:
                return "Username"

            case .about:
                return "About (Optional)"

            case .state:
                return "State"

            case .city:
                return "City"

            case .visitLinks:
                return "Visit Links"

            case .gender:
                return "Gender"

            case .dateOfBirth:
                return "Date of Birth"
            
            case .terms:
                return ""
            }
        }
}


let basicInfo = BasicInfo(
    namePlaceholder: "Enter Name",
    usernamePlaceholder: "@username"
)

let aboutInfo = AboutInfo(
    placeholder: "Enter here"
)


let locationInfo = LocationInfo(
    states: [
        "Uttar Pradesh",
        "Delhi",
        "Punjab",
        "Maharashtra",
        "Rajasthan"
    ],
    cities: [
        "Ghaziabad",
        "Noida",
        "Lucknow",
        "Delhi",
        "Mumbai"
    ]
)

let genderInfo = GenderInfo(
    genders: [
        "Male",
        "Female",
        "Other"
    ]
)



let dobInfo = DateOfBirthInfo(
    placeholder: "DD/MM/YYYY"
)

var links = [

    LinkInfo(
        imageName: "webLink",
        placeholder: "Website Link"
    ),

    LinkInfo(
        imageName: "whatsApp",
        placeholder: "WhatsApp Number"
    ),

    LinkInfo(
        imageName: "Email",
        placeholder: "Contact Email"
    ),

    LinkInfo(
        imageName: "faceBook",
        placeholder: "Facebook Link"
    ),

    LinkInfo(
        imageName: "googleMap",
        placeholder: "Google Map"
    ),

    LinkInfo(
        imageName: "twitter",
        placeholder: "Twitter Link"
    ),

    LinkInfo(
        imageName: "youtube",
        placeholder: "YouTube Link"
    ),

    LinkInfo(
        imageName: "insgram",
        placeholder: "Instagram Link"
    ),

    LinkInfo(
        imageName: "tiktok",
        placeholder: "TikTok Link"
    ),

    LinkInfo(
        imageName: "LinkedIn",
        placeholder: "LinkedIn Link"
    )
]


let viewBorderColor = UIColor(hex: "FFFFFF").withAlphaComponent(0.3) as! CGColor




/// for validation and verification

struct PersonalProfileValidation {
       
       var name : String = ""
        var username: String = ""
        var about: String = ""
        var state: String = ""
        var city: String = ""
        var gender: String = ""
        var dob: String = ""

        var links: [String] = []

        var isTermsAccepted: Bool = false
}



