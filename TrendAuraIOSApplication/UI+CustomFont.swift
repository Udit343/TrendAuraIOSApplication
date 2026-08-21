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
    class func Outfit_SemiBold(size: CGFloat)->UIFont{
        UIFont(name: "Outfit-SemiBold", size: calculateSize(for: size))!
    }
    
    class func Outfit_Bold(size: CGFloat) -> UIFont{ UIFont(name: "Outfit-Bold", size: calculateSize(for: size))!
    }
    
    
    class func Outfit_Medium(size: CGFloat)->UIFont{
          UIFont(name: "Outfit-Medium", size: calculateSize(for: size))!
    }
    
//    class func Outfit_Medium_Fixed(size: CGFloat)->UIFont{
//          UIFont(name: "Outfit-Medium", size: size)!
//    }
    
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
    
    class func Manrope_Regular(size : CGFloat)->UIFont{
        UIFont(name: "Manrope-Regular", size: calculateSize(for: size))!
    }
    
    class func Manrope_Light(size : CGFloat)->UIFont{
        UIFont(name: "Manrope-Light", size: calculateSize(for: size))!
    }
    
    
    class func Manrope_Medium(size : CGFloat)->UIFont{
        UIFont(name: "Manrope-Medium", size: calculateSize(for: size))!
    }
}



func Outfit_Medium_Fixed(size: CGFloat) -> UIFont {
    UIFont(
        name: "Outfit-Medium",
        size: calculateFixedSize(for: size)
    )!
}

private  func calculateFixedSize(for size: CGFloat) -> CGFloat {

    var adjustedSize = size

    if IS_IPHONE {

        switch SCREEN_MAX_LENGTH {

        case 480:
            adjustedSize = size - 2

        case 568:
            adjustedSize = size - 2

        case 667:
            adjustedSize = size - 2

        case 736:
            adjustedSize = size - 1

        default:
            adjustedSize = size-1
        }

    } else if IS_IPAD {

        adjustedSize = size
    }

    return adjustedSize
}
