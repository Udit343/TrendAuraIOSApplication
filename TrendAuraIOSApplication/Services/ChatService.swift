
//  ChatService.swift
//  TrendAuraIOSApplication
//  Created by UDIT PANDEY on 22/09/26.

import Foundation
import FirebaseFirestore

final class ChatService {
    static let shared = ChatService()
    private let db = Firestore.firestore()
    private init() {}

    func conversationId(userA: String, userB: String) -> String {
        [userA, userB].sorted().joined(separator: "_")
    }

    
    func sendMessage(from senderId: String, to receiverId: String, text: String) {
        let convoId = conversationId(userA: senderId, userB: receiverId)
        let convoRef = db.collection("conversations").document(convoId)
        let messageRef = convoRef.collection("messages").document()

        let message = ChatMessage(id: nil, senderdId: senderId, text: text, timestamp: Date())

        do {
            try messageRef.setData(from: message)


            convoRef.setData([
                "participants": [senderId, receiverId],
                "lastMessage": text,
                "lastMessageTimestamp": Timestamp(date: Date())
            ], merge: true)

        } catch {
            print(" Failed to send message:", error)
        }
    }

    
    func listenForMessages(userA: String, userB: String, onUpdate: @escaping ([ChatMessage]) -> Void) -> ListenerRegistration {
        let convoId = conversationId(userA: userA, userB: userB)

        return db.collection("conversations")
            .document(convoId)
            .collection("messages")
            .order(by: "timestamp")
            .addSnapshotListener { snapshot, error in
                guard let snapshot = snapshot else {
                    print("Listener error:", error?.localizedDescription ?? "unknown")
                    return
                }

                let messages = snapshot.documents.compactMap { doc -> ChatMessage? in
                    try? doc.data(as: ChatMessage.self)
                }

                onUpdate(messages)
            }
    }
}
