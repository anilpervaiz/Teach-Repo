//
//  ChatViewModel.swift
//  Teachers
//

import Foundation
import MessageKit

struct ChatViewModel {
    private var reversedChat: [Message] = []
    lazy private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    let parentName: String
    let parentImageName: String
    var chatMessages: [Message]
    let currentUser: Sender
    let chatPerson: Sender
    
    var showableChat: [Message] { return chatMessages.reversed() }
    var chatPersonName: String { return chatPerson.displayName }
    var chatPersonImage: UIImage { return chatPerson.displayImage }
    var chatPersonActiveStatus: String { return chatPerson.activeStatus }
    
    init (
        parentName: String,
        parentImageName: String,
        chatMessages: [Message],
        currentUser: Sender,
        chatPerson: Sender
    ) {
        self.parentName = parentName
        self.parentImageName = parentImageName
        self.chatMessages = chatMessages
        self.currentUser = currentUser
        self.chatPerson = chatPerson
    }
    
    mutating func showableDateTime(of message: Message) -> String {
        return dateFormatter.string(from: message.sentDate)
    }
}

struct Message: MessageType {
    var sender: SenderType {
        return sentBy
    }
    var messageId: String
    var sentBy: Sender
    var sentDate: Date
    var kind: MessageKind
    
    private init(kind: MessageKind, sentBy: Sender, messageId: String, date: Date) {
        self.kind = kind
        self.sentBy = sentBy
        self.messageId = messageId
        self.sentDate = date
    }

    init(text: String, sentBy: Sender, messageId: String, date: Date) {
        self.init(kind: .text(text), sentBy: sentBy, messageId: messageId, date: date)
    }
}

struct Sender: SenderType, Equatable {
    var senderId: String
    var displayName: String
    var displayImage: UIImage
    var activeStatus: String
}


extension MockData {
    static var currentUser = Sender(senderId: "000020", displayName: "Steve Deutsch", displayImage: Asset.Media.avatar.image, activeStatus: "")
    static var otherUser = Sender(senderId: "000021", displayName: "Jaime Deutsch", displayImage: Asset.Media.avatar.image, activeStatus: "Active Now")
    
    static var chatViewModel = ChatViewModel(
        parentName: "Essam Ahmed",
        parentImageName: Asset.Media.parent.name,
        chatMessages: [
            Message(
                text: "Hello Ahmed, can you help teach me about grammar for exams this weekend?",
                sentBy: MockData.currentUser,
                messageId: "",
                date: Date()
            ),
            Message(
                text: "Sure!",
                sentBy: MockData.otherUser,
                messageId: "",
                date: Date()
            ),
            Message(
                text: "I really want to help you anytime",
                sentBy: MockData.otherUser,
                messageId: "",
                date: Date()
            ),
            Message(
                text: "Thank you in advance",
                sentBy: MockData.currentUser,
                messageId: "",
                date: Date()
            ),
            Message(
                text: "I am very difficult to understand grammar in everyday conversations with other people",
                sentBy: MockData.currentUser,
                messageId: "",
                date: Date()
            ),
            Message(
                text: "Ok it's very easy",
                sentBy: MockData.otherUser,
                messageId: "",
                date: Date()
            )],
        currentUser: MockData.currentUser,
        chatPerson: MockData.otherUser
    )
}

