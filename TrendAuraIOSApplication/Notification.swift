//  Notification.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 12/08/26.

import Foundation
import UIKit

struct NotificationCard{
    let profileImage : String
    let notificationImage : String
    let name : String
    let description : String
    let timeString : String
}

struct NotificationSection {
 let  title : String
let allCard : [NotificationCard]
    
}

let allNotificationData :  [NotificationSection] = [
    
    NotificationSection(
        title: "Today",
        allCard: [
            
            NotificationCard(
                profileImage: "noti1",
                notificationImage: "notificationLike",
                name: "Elayamani",
                description: "Liked Your Post",
                timeString: "1hr ago."
            ),
            
            NotificationCard(
                profileImage: "noti2",
                notificationImage: "notificationLike",
                name: "Jhony vino",
                description: "Mentioned you in a comment in a post",
                timeString: "3d Ago."
            ),
            
            NotificationCard(
                profileImage: "noti3",
                notificationImage: "notificationMessage",
                name: "Jhony vino",
                description: "started following.",
                timeString: "3d Ago."
            )
        ]
    ),
    
    
    NotificationSection(
        title: "Yesterday",
        allCard: [
            
            NotificationCard(
                profileImage: "noti4",
                notificationImage: "notificationLike",
                name: "Elayamani",
                description: "Liked Your Post",
                timeString: "1hr ago."
            ),
            
            NotificationCard(
                profileImage: "noti5",
                notificationImage: "notificationLike",
                name: "Thoms",
                description: "Liked Your Post",
                timeString: "Jul 23, 2023 at 09:15 AM"
            ),
            
            NotificationCard(
                profileImage: "noti6",
                notificationImage: "notificationMessage",
                name: "Jhony vino",
                description: "Mentioned you in a comment in a post",
                timeString: "Jul 23, 2023 at 09:15 AM"
            ),
            
            NotificationCard(
                profileImage: "noti7",
                notificationImage: "notificationMessage",
                name: "Jhony vino",
                description: "Mentioned you in a comment in a post",
                timeString: "Jul 23, 2023 at 09:15 AM"
            )
        ]
    ),
    
    NotificationSection(
        title: "12-08-2026",
        allCard: [
            
            NotificationCard(
                profileImage: "noti4",
                notificationImage: "notificationLike",
                name: "Elayamani",
                description: "Liked Your Post",
                timeString: "1hr ago."
            ),
            
            NotificationCard(
                profileImage: "noti5",
                notificationImage: "notificationLike",
                name: "Thoms",
                description: "Liked Your Post",
                timeString: "Jul 23, 2023 at 09:15 AM"
            ),
            
            NotificationCard(
                profileImage: "noti6",
                notificationImage: "notificationMessage",
                name: "Jhony vino",
                description: "Mentioned you in a comment in a post",
                timeString: "Jul 23, 2023 at 09:15 AM"
            ),
            
            NotificationCard(
                profileImage: "noti7",
                notificationImage: "notificationMessage",
                name: "Jhony vino",
                description: "Mentioned you in a comment in a post",
                timeString: "Jul 23, 2023 at 09:15 AM"
            )
        ]
    ),
    NotificationSection(
        title: "11-08-2026",
        allCard: [
            
            NotificationCard(
                profileImage: "noti1",
                notificationImage: "notificationLike",
                name: "Elayamani",
                description: "Liked Your Post",
                timeString: "1hr ago."
            ),
            
            NotificationCard(
                profileImage: "noti2",
                notificationImage: "notificationLike",
                name: "Thoms",
                description: "Liked Your Post",
                timeString: "Jul 23, 2023 at 09:15 AM"
            ),
            
            NotificationCard(
                profileImage: "noti3",
                notificationImage: "notificationMessage",
                name: "Jhony vino",
                description: "Mentioned you in a comment in a post",
                timeString: "Jul 23, 2023 at 09:15 AM"
            ),
            
            NotificationCard(
                profileImage: "noti4",
                notificationImage: "notificationMessage",
                name: "Jhony vino",
                description: "Mentioned you in a comment in a post",
                timeString: "Jul 23, 2023 at 09:15 AM"
            )
        ]
    ),
    
    NotificationSection(
        title: "10-08-2026",
        allCard: [
            
            NotificationCard(
                profileImage: "noti1",
                notificationImage: "notificationLike",
                name: "Elayamani",
                description: "Liked Your Post",
                timeString: "1hr ago."
            ),
            
            NotificationCard(
                profileImage: "noti2",
                notificationImage: "notificationLike",
                name: "Thoms",
                description: "Liked Your Post",
                timeString: "Jul 23, 2023 at 09:15 AM"
            ),
            
            NotificationCard(
                profileImage: "noti3",
                notificationImage: "notificationMessage",
                name: "Jhony vino",
                description: "Mentioned you in a comment in a post",
                timeString: "Jul 23, 2023 at 09:15 AM"
            ),
            
            NotificationCard(
                profileImage: "noti4",
                notificationImage: "notificationMessage",
                name: "Jhony vino",
                description: "Mentioned you in a comment in a post",
                timeString: "Jul 23, 2023 at 09:15 AM"
            )
        ]
    )
]
