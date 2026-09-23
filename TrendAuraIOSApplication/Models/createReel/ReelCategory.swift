
//  ReelCategory.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 18/09/26.

import Foundation

struct CategoryResponse: Decodable {
    let message: String
    let data: [ReelCategory]
}

struct ReelCategory: Decodable {
    let categoryId: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case categoryId = "category_id"
        case name
    }
}
