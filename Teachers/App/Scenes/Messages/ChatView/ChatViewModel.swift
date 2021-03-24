//
//  ChatViewModel.swift
//  Teachers
//

import Foundation

struct ChatViewModel {
    let parentName: String
    let parentImageName: String
    let chatMessages: [ChatMessage]
}

struct ChatMessage {
    let text: String
    let type: ChatMessageType
    let time: String
}

enum ChatMessageType: CaseIterable {
    case sent
    case received
}


extension MockData {
    static var chat = ChatViewModel(
        parentName: "Essam Ahmed",
        parentImageName: Asset.Media.parent.name,
        chatMessages: [
            ChatMessage(text: "Hello Ahmed, can you help teach me about grammar for exams this weekend?", type: .received, time: "10:00 AM"),
            ChatMessage(text: "Sure!", type: .sent, time: "10:23 AM"),
            ChatMessage(text: "I really want to help you anytime", type: .sent, time: "10:23 AM"),
            ChatMessage(text: "Thank you in advance", type: .received, time: "10:35 AM"),
            ChatMessage(text: "I am very difficult to understand grammar in everyday conversations with other people", type: .received, time: "10:35 AM"),
            ChatMessage(text: "Ok it's very easy", type: .sent, time: "10:40 AM"),
        ])
}

