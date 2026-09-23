
//  Conversation.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 22/09/26.

import Foundation
import FirebaseFirestore

struct Conversation: Codable, Identifiable {
    @DocumentID var id: String?
    let participants: [String]
    var lastMessage: String
    var lastMessageTimestamp: Date
}
