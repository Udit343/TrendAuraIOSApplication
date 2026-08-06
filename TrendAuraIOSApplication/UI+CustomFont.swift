//  UI+CustomFont.swift
//  HoneyHole
//  Created by Shivam Tyagi on 30/09/24.

import UIKit

// MARK: - Device Info
let IS_IPAD = (UI_USER_INTERFACE_IDIOM() == .pad)
let IS_IPHONE = (UI_USER_INTERFACE_IDIOM() == .phone)
let IS_RETINA = (UIScreen.main.scale >= 2.0)
let screenHeightFactor = UIScreen.main.bounds.height / 568
let screenWidthFactor = UIScreen.main.bounds.width / 320

// MARK: - Device Sizes
let SCREEN_MAX_LENGTH = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)

// iPhones
let IS_IPHONE_4_OR_LESS = IS_IPHONE && SCREEN_MAX_LENGTH < 568
let IS_IPHONE_5 = IS_IPHONE && SCREEN_MAX_LENGTH == 568
let IS_IPHONE_6 = IS_IPHONE && SCREEN_MAX_LENGTH == 667
let IS_IPHONE_6P = IS_IPHONE && SCREEN_MAX_LENGTH == 736
let IS_IPHONE_X = IS_IPHONE && SCREEN_MAX_LENGTH == 812
let IS_IPHONE_XSMax = IS_IPHONE && SCREEN_MAX_LENGTH == 896
let IS_IPHONE_12 = IS_IPHONE && SCREEN_MAX_LENGTH == 844
let IS_IPHONE_12ProMax = IS_IPHONE && SCREEN_MAX_LENGTH == 926
let IS_IPHONE_15ProMax = IS_IPHONE && SCREEN_MAX_LENGTH == 932
let IS_IPHONE_16ProMax = IS_IPHONE && SCREEN_MAX_LENGTH == 956

// iPads
let IS_IPAD_PRO_1024 = IS_IPAD && SCREEN_MAX_LENGTH == 1024
let IS_IPAD_PRO_1112 = IS_IPAD && SCREEN_MAX_LENGTH == 1112
let IS_IPAD_PRO_1180 = IS_IPAD && SCREEN_MAX_LENGTH == 1180
let IS_IPAD_PRO_1366 = IS_IPAD && SCREEN_MAX_LENGTH == 1366

// MARK: - Font Size Calculator
private func calculateSize(for size: CGFloat) -> CGFloat {
    let isLandscape = UIScreen.main.bounds.width > UIScreen.main.bounds.height
    var adjustedSize = size

    if IS_IPHONE {
        switch SCREEN_MAX_LENGTH {
//        case 480: adjustedSize -= 2
        case 480: adjustedSize = size
        case 568: adjustedSize = size
//        case 667: adjustedSize += 2
        case 667: adjustedSize += 2
//        case 736: adjustedSize += 5
        case 736: adjustedSize += 5
        case 812: adjustedSize += isLandscape ? 3 : 4
        case 844: adjustedSize += isLandscape ? 4 : 5
        case 896: adjustedSize += isLandscape ? 5 : 6
        case 926: adjustedSize += isLandscape ? 5 : 6
        case 932: adjustedSize += isLandscape ? 6 : 7
        case 956: adjustedSize += isLandscape ? 6 : 7
        default: adjustedSize += 4
        }
    } else if IS_IPAD {
        switch SCREEN_MAX_LENGTH {
        case 1024: adjustedSize += isLandscape ? 10 : 12
        case 1112: adjustedSize += isLandscape ? 8 : 10
        case 1180: adjustedSize += isLandscape ? 12 : 14
        case 1366: adjustedSize += isLandscape ? 18 : 20
        default: adjustedSize += 8
        }
    }

    return adjustedSize
}

// MARK: - UIFont Extension
extension UIFont {
    class func fontWithSize(size: CGFloat) -> CGFloat {
        return calculateSize(for: size)
    }

    // MARK: - Poppins Fonts
    class func Poppins_Black(size: CGFloat) -> UIFont { UIFont(name: "Poppins-Black", size: calculateSize(for: size))! }
    class func Poppins_BlackItalic(size: CGFloat) -> UIFont { UIFont(name: "Poppins-BlackItalic", size: calculateSize(for: size))! }
    class func Poppins_Bold(size: CGFloat) -> UIFont { UIFont(name: "Poppins-Bold", size: calculateSize(for: size))! }
    class func Poppins_BoldItalic(size: CGFloat) -> UIFont { UIFont(name: "Poppins-BoldItalic", size: calculateSize(for: size))! }
    class func Poppins_ExtraBold(size: CGFloat) -> UIFont { UIFont(name: "Poppins-ExtraBold", size: calculateSize(for: size))! }
    class func Poppins_ExtraBoldItalic(size: CGFloat) -> UIFont { UIFont(name: "Poppins-ExtraBoldItalic", size: calculateSize(for: size))! }
    class func Poppins_ExtraLight(size: CGFloat) -> UIFont { UIFont(name: "Poppins-ExtraLight", size: calculateSize(for: size))! }
    class func Poppins_ExtraLightItalic(size: CGFloat) -> UIFont { UIFont(name: "Poppins-ExtraLightItalic", size: calculateSize(for: size))! }
    class func Poppins_Italic(size: CGFloat) -> UIFont { UIFont(name: "Poppins-Italic", size: calculateSize(for: size))! }
    class func Poppins_Light(size: CGFloat) -> UIFont { UIFont(name: "Poppins-Light", size: calculateSize(for: size))! }
    class func Poppins_LightItalic(size: CGFloat) -> UIFont { UIFont(name: "Poppins-LightItalic", size: calculateSize(for: size))! }
    class func Poppins_Medium(size: CGFloat) -> UIFont { UIFont(name: "Poppins-Medium", size: calculateSize(for: size))! }
    class func Poppins_MediumItalic(size: CGFloat) -> UIFont { UIFont(name: "Poppins-MediumItalic", size: calculateSize(for: size))! }
    class func Poppins_Regular(size: CGFloat) -> UIFont { UIFont(name: "Poppins-Regular", size: calculateSize(for: size))! }
    class func Poppins_SemiBold(size: CGFloat) -> UIFont { UIFont(name: "Poppins-SemiBold", size: calculateSize(for: size))! }
    class func Poppins_SemiBoldItalic(size: CGFloat) -> UIFont { UIFont(name: "Poppins-SemiBoldItalic", size: calculateSize(for: size))! }
    class func Poppins_Thin(size: CGFloat) -> UIFont { UIFont(name: "Poppins-Thin", size: calculateSize(for: size))! }
    class func Poppins_ThinItalic(size: CGFloat) -> UIFont { UIFont(name: "Poppins-ThinItalic", size: calculateSize(for: size))! }
    
    class func Outfit_SemiBold(size: CGFloat)->UIFont{
        UIFont(name: "Outfit-SemiBold", size: calculateSize(for: size))!
    }
    
    class func Outfit_Bold(size: CGFloat) -> UIFont{ UIFont(name: "Outfit-Bold", size: calculateSize(for: size))!
    }
    
    
    class func Outfit_Medium(size: CGFloat)->UIFont{
          UIFont(name: "Outfit-Medium", size: calculateSize(for: size))!
    }
    
    class func Outfit_Regular(size: CGFloat)->UIFont{
        UIFont(name: "Outfit-Regular", size: calculateSize(for: size))!
    }
    
    class  func Outfit_Light(size : CGFloat)->UIFont{
        UIFont(name: "Outfit-Light", size: calculateSize(for: size))!
    }
    
    class func Manrope_SemiBold(size: CGFloat)->UIFont{
          UIFont(name: "Manrope-SemiBold", size: calculateSize(for: size))!
    }
    
    class func Manrope_Bold(size: CGFloat)->UIFont{
        UIFont(name: "Manrope-Bold", size: calculateSize(for: size))!
    }
    class func Inter_SemiBold(size: CGFloat)->UIFont{
        UIFont(name: "Inter_18pt-SemiBold", size: calculateSize(for: size))!
    }
    

    // MARK: - RoundedMplus1c Fonts
    class func MRoundedMplus1c_Black(size: CGFloat) -> UIFont { UIFont(name: "RoundedMplus1c-Black", size: calculateSize(for: size))! }
    class func RoundedMplus1c_Bold(size: CGFloat) -> UIFont { UIFont(name: "RoundedMplus1c-Bold", size: calculateSize(for: size))! }
    class func RoundedMplus1c_ExtraBold(size: CGFloat) -> UIFont { UIFont(name: "RoundedMplus1c-ExtraBold", size: calculateSize(for: size))! }
    class func RoundedMplus1c_Light(size: CGFloat) -> UIFont { UIFont(name: "RoundedMplus1c-Light", size: calculateSize(for: size))! }
    class func RoundedMplus1c_Medium(size: CGFloat) -> UIFont { UIFont(name: "RoundedMplus1c-Medium", size: calculateSize(for: size))! }
    class func RoundedMplus1c_Regular(size: CGFloat) -> UIFont { UIFont(name: "RoundedMplus1c-Regular", size: calculateSize(for: size))! }
    class func RoundedMplus1c_Thin(size: CGFloat) -> UIFont { UIFont(name: "RoundedMplus1c-Thin", size: calculateSize(for: size))! }
}

