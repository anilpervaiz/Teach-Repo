//
//  MessageViewModel.swift
//  Teachers
//

import Foundation

struct MessageViewModel {
    let senderImageName: String
    let senderName: String
    let lastMessage: String
    let lastMessageTime: String
    let newMessagesCount: String?
    let senderActiveStatus: UserActiveStatus
}

extension MessageViewModel {
    enum UserActiveStatus: CaseIterable {
        case online
        case offline
    }
}
