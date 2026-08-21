import Foundation
import UIKit



struct InsightOption {
    let imageName: String
    let title: String
    let subtitle: String
    let count: String
}



struct InsightTitle {
    let title: String
    let subtitles: [String]
}



struct InsightShowDataVisual {
    let title: String
    let percentage: String
}



struct InsightContainer {
    let insightTitle: InsightTitle?
    let insightOptions: [InsightOption]?
    let insightShowDataVisual: [InsightShowDataVisual]?
}


let insightData: [InsightContainer] = [

    
    InsightContainer(
        
        insightTitle: nil,
        
        insightOptions: [
            
            InsightOption(
                imageName: "ins1",
                title: "Profile Visit",
                subtitle: "+3,914%",
                count: "50.5K"
            ),
            
            InsightOption(
                imageName: "ins2",
                title: "People Like",
                subtitle: "+6,450%",
                count: "69K"
            ),
            
            InsightOption(
                imageName: "ins3",
                title: "People Follow",
                subtitle: "+50%",
                count: "23K"
            ),
            
            InsightOption(
                imageName: "ins4",
                title: "Share Profile",
                subtitle: "+3,914%",
                count: "23.2K"
            ),
            
            InsightOption(
                imageName: "ins5",
                title: "Added in Cart",
                subtitle: "+100%",
                count: "69"
            ),
            
            InsightOption(
                imageName: "ins6",
                title: "Visit Clicks",
                subtitle: "+55%",
                count: "20K"
            )
        ],
        
        insightShowDataVisual: nil
    ),


    
    InsightContainer(
        
        insightTitle: InsightTitle(
            title: "Reached Audience",
            subtitles: [
                "Cities",
                "Countries"
            ]
        ),
        
        insightOptions: nil,
        
        insightShowDataVisual: [
            
            InsightShowDataVisual(
                title: "USA",
                percentage: "89%"
            ),
            
            InsightShowDataVisual(
                title: "India",
                percentage: "50.7%"
            ),
            
            InsightShowDataVisual(
                title: "Brazil",
                percentage: "77.2%"
            ),
            
            InsightShowDataVisual(
                title: "Germany",
                percentage: "12.5%"
            )
        ]
    ),


    
    InsightContainer(
        
        insightTitle: InsightTitle(
            title: "Gender Ratio",
            subtitles: [
                "Men",
                "Women",
                "Other"
            ]
        ),
        
        insightOptions: nil,
        
        insightShowDataVisual: [
            
            InsightShowDataVisual(
                title: "Men",
                percentage: "60%"
            ),
            
            InsightShowDataVisual(
                title: "Women",
                percentage: "65%"
            ),
            
            InsightShowDataVisual(
                title: "Other",
                percentage: "45%"
            )
        ]
    ),


    
    InsightContainer(
        
        insightTitle: InsightTitle(
            title: "Age Range",
            subtitles: [
                "All",
                "Men",
                "Women",
                "Other"
            ]
        ),
        
        insightOptions: nil,
        
        insightShowDataVisual: [
            
            InsightShowDataVisual(
                title: "13-17 years",
                percentage: "42%"
            ),
            
            InsightShowDataVisual(
                title: "18-24 years",
                percentage: "68%"
            ),
            
            InsightShowDataVisual(
                title: "25-34 years",
                percentage: "77%"
            ),
            
            InsightShowDataVisual(
                title: "35-44 years",
                percentage: "33%"
            )
        ]
    )
]
