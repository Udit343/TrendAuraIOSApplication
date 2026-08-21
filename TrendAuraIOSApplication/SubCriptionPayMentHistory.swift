//
//  SubCriptionPayMentHistory.swift
//  TrendAuraIOSApplication
//
//  Created by UDIT PANDEY on 11/08/26.
//

import Foundation
import UIKit

struct History {
    let imageName: String
    let title: String
    let date: String
    let amount: String
}

let allHistory: [History] = [
    History(
        imageName: "myplanimage_",
        title: "Purchase Mid-size Business ",
        date: "02 Sep,2024",
        amount: "$49.99"
    ),
    History(
        imageName: "paidLinks",
        title: "Paid links clicked",
        date: "02 Sep,2024",
        amount: "$123.52"
    ),
    History(
        imageName: "boost",
        title: "3 Boost purchased ",
        date: "01 Aug 2026",
        amount: "$9.99"
    ),
    
    History(
        imageName: "myplanimage_",
        title: "Purchase Mid-size Business ",
        date: "02 Sep,2024",
        amount: "$49.99"
    ),
    History(
        imageName: "paidLinks",
        title: "Paid links clicked",
        date: "02 Sep,2024",
        amount: "$123.52"
    ),
    History(
        imageName: "boost",
        title: "3 Boost purchased ",
        date: "01 Aug 2026",
        amount: "$9.99"
    ),
    
    History(
        imageName: "myplanimage_",
        title: "Purchase Mid-size Business ",
        date: "02 Sep,2024",
        amount: "$49.99"
    ),
    History(
        imageName: "paidLinks",
        title: "Paid links clicked",
        date: "02 Sep,2024",
        amount: "$123.52"
    ),
    History(
        imageName: "boost",
        title: "3 Boost purchased ",
        date: "01 Aug 2026",
        amount: "$9.99"
    ),
    
    History(
        imageName: "myplanimage_",
        title: "Purchase Mid-size Business ",
        date: "02 Sep,2024",
        amount: "$49.99"
    ),
    History(
        imageName: "paidLinks",
        title: "Paid links clicked",
        date: "02 Sep,2024",
        amount: "$123.52"
    ),
    History(
        imageName: "boost",
        title: "3 Boost purchased ",
        date: "01 Aug 2026",
        amount: "$9.99"
    ),
    
]


enum allCategory{
    case myPlan
    case LinkCicked
    case PayMentHistory
}
