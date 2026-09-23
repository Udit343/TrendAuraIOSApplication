//  ChatMessage.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 22/09/26.

import Foundation
import FirebaseFirestore

struct ChatMessage : Codable , Identifiable {
       @DocumentID var id: String?
       let senderdId : String
       let text : String
       let timestamp : Date
}












