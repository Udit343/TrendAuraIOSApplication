//  ExploreMapping.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 03/09/26.

import Foundation

extension ReelItem {
    
    func toProductItem() -> ProductItem {
        ProductItem(
            reelId : reelId,
            productImage: thumbnailUrl,
            profileImage: profilePic,
            profileName: name,
            title: title,
            subTitle: tags,
            visitCount: "\(viewsCount)",
            likeCount: "\(totalLikes) Likes",
            isFavourite: isFavourite == 1
        )
    }
}

extension PopularStoreItem {
    func toStoreItem() -> StoreItem {
        StoreItem(
            image: profilePic,
            name: name
            // add/remove fields to match your real StoreItem exactly
        )
    }
}

extension TagItem {
    func toHotItem() -> HotItem {
        HotItem(
            title: "#\(tag)"
            // add/remove fields to match your real HotItem exactly
        )
    }
}



extension FavouriteReelItem {
    func toProductItem() -> ProductItem {
        ProductItem(
            reelId: reelId,
            productImage: thumbnailUrl,
            profileImage: profilePic,
            profileName: name,
            title: title,
            subTitle: tags,
            visitCount: "\(viewsCount)",
            likeCount: "\(totalLikes) Likes",
            isFavourite: true
        )
    }
    
    var formattedAddedDate: String {
            let isoFormatter = ISO8601DateFormatter()
            isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

            guard let date = isoFormatter.date(from: addFavouriteReelDate) else {
                return ""
            }

            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = "d MMM yyyy, h:mm a"
            return displayFormatter.string(from: date)
        }

}

