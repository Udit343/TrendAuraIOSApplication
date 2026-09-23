//  ExploreSection.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 03/09/26.


import Foundation

enum ExploreSectionTypes {
    case reels(title: String, items: [ProductItem])
    case stores(title: String, items: [StoreItem])
    case tags(title: String, items: [HotItem])
}

struct ExploreSections {
    let type: ExploreSectionTypes

    var title: String {
        switch type {
        case .reels(let title, _): return title
        case .stores(let title, _): return title
        case .tags(let title, _): return title
        }
    }
}
