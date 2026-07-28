//  filter.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 27/07/26.


import Foundation
import UIKit
//
////struct PeopleChoice{
////    let choice : String
////}
////
////struct UploadData {
////    let data : String
////}
////
////struct Duration {
////    let time : String
////}
//
//enum FilterSectionType{
//    case PeopleChoice
//    case UploadData
//    case Duration
//}
//
//
//struct AllSection{
//    
//    let title : String
//    
//    let filterSectionType : FilterSectionType
//    
//    let PeopleChoice  : [String]
//    let UploadData : [String]
//    let Duration : [String]
//}
//
//let AllSectionData : [AllSection]  = [
//    AllSection(title: "PeopleChoice",
//               filterSectionType: .PeopleChoice,
//               PeopleChoice: ["Most likes","Most share","Most visits", "Most add to carts","Most likes","Most share","Most visits", "Most add to carts"],
//               UploadData: [],
//               Duration: []
//    ),
//    
//    AllSection(title: "UploadData",filterSectionType: .UploadData,
//               PeopleChoice: [],
//               UploadData: ["Any Time","Today","This Week","This Month","Any Time","Today","This Week","This Month"],
//               Duration: []
//    ),
//    
//    AllSection(title: "UploadData",
//               filterSectionType: .Duration,
//               PeopleChoice: [],
//               UploadData: [],
//               Duration: ["Any","Under 30 Seconds","Under 60 Seconds","Any","Under 30 Seconds","Under 60 Seconds"]
//              )
//    
//]


//new model

struct FilterSection {
  let   title : String
  let   items : [String]
}

let allFilterSections : [FilterSection] = [
    FilterSection(
            title: "People's Choice ",
            items: [
                "Most Likes",
                "Most Share",
                "Most Visits",
                "Most add to carts"
            ]
        ),

        FilterSection(
            title: "Upload Date",
            items: [
                "Any Time",
                "Today",
                "This Week",
                "This Month"
                
            ]
        ),
    
    FilterSection(
        title: "Distance",
        items: [""]
    ),

        FilterSection(
            title: "Duration",
            items: [
                "Any",
                "Under 30 Seconds",
                "Under 60 Seconds"
            ]
        )
]


