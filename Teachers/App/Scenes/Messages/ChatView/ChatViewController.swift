//
//  ChatViewController.swift
//  Teachers
//

import Foundation
import UIKit
import MessageKit
import InputBarAccessoryView

class ChatViewController: MessagesViewController {
            
    var viewModel: ChatViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupParentView()
        configureMessageCollectionView()
        configureMessageInputBar()
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.barStyle = .blackOpaque
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: Asset.Media.moreOptions.image,
            style: .plain,
            target: self,
            action: #selector(moreOptionsTapped)
        )
        setupChatHeader()
    }

    private func setupChatHeader() {
        guard let vm = viewModel else { return }
        let chatHeader = ChatHeaderView(frame: CGRect(x: 0, y: 0, width: 200, height: 48))
        chatHeader.configureFrom(
            chatPersonName: vm.chatPersonName,
            chatPersonImage: vm.chatPersonImage,
            chatPersonActiveStatus: vm.chatPersonActiveStatus
        )

        navigationItem.titleView = chatHeader
    }

    private func setupParentView() {
        guard let vm = viewModel else {
            return
        }
        let chatParentView = ChatParentView()
        chatParentView.translatesAutoresizingMaskIntoConstraints = false
        chatParentView.transform = CGAffineTransform(rotationAngle: .pi)
        let chatParentViewHeight: CGFloat = 56.0
        messagesCollectionView.addSubview(chatParentView)
        NSLayoutConstraint.activate([
            chatParentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8.0),
            chatParentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatParentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatParentView.heightAnchor.constraint(equalToConstant: chatParentViewHeight)
        ])
        chatParentView.configureWith(parentName: vm.parentName, parentImage: Asset.Media.parent.image, onMessageTapped: {
            print("Message to parent tapped")
        })
        messagesCollectionView.contentInset.top = chatParentViewHeight
    }
    
    private func configureMessageCollectionView() {
        let layout = messagesCollectionView.collectionViewLayout as? MessagesCollectionViewFlowLayout
        layout?.sectionInset = UIEdgeInsets(top: 1, left: 12, bottom: 1, right: 12)
        
        layout?.setMessageOutgoingAvatarSize(.zero)
        layout?.setMessageIncomingAvatarSize(.zero)
        layout?.setMessageOutgoingMessageBottomLabelAlignment(
            LabelAlignment(textAlignment: .right, textInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 4))
        )
        layout?.setMessageIncomingMessageBottomLabelAlignment(
            LabelAlignment(textAlignment: .left, textInsets: UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0))
        )
        
        messagesCollectionView.transform = CGAffineTransform(rotationAngle: .pi)
        
        messagesCollectionView.messagesDataSource = self
//        messagesCollectionView.messageCellDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        scrollsToLastItemOnKeyboardBeginsEditing = true // default false
        //maintainPositionOnKeyboardFrameChanged = true // default false

        //showMessageTimestampOnSwipeLeft = true // default false
  //      messagesCollectionView.refreshControl = refreshControl
    }
    
    private func configureMessageInputBar() {
        //messageInputBar.delegate = self
        messageInputBar.inputTextView.tintColor = Asset.Colors.halfBaked.color
        
        messageInputBar.inputTextView.backgroundColor = Asset.Colors.lightGray.color.withAlphaComponent(0.16)

        messageInputBar.inputTextView.textContainerInset = UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)
        messageInputBar.padding = UIEdgeInsets(top: 15, left: 16, bottom: 15, right: 16)
        
        messageInputBar.inputTextView.placeholderTextColor = Asset.Colors.gray.color
        messageInputBar.inputTextView.placeholderLabelInsets = UIEdgeInsets(top: 6, left: 16, bottom: 6, right: 36)

        //messageInputBar.inputTextView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1).cgColor
        //messageInputBar.inputTextView.layer.borderWidth = 1.0
        messageInputBar.inputTextView.layer.cornerRadius = 18.0
        messageInputBar.inputTextView.layer.masksToBounds = true
        //messageInputBar.middleContentViewPadding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        
        configureInputBarItems()
    }
    
    private func configureInputBarItems() {
        //messageInputBar.sendButton.contentEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        //messageInputBar.sendButton.setSize(CGSize(width: 24, height: 24), animated: false)
        messageInputBar.sendButton.image = Asset.Media.send.image
        messageInputBar.sendButton.title = nil
    }
        
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath)
        cell.transform = CGAffineTransform(rotationAngle: .pi)
        return cell
    }
         
    @objc
    func moreOptionsTapped() {
        print("more options button Tapped")
    }
}

// MARK: - Helpers

extension ChatViewController {
    func isNextMessageSameSender(at indexPath: IndexPath) -> Bool {
        guard let vm = viewModel else { return false }
        let messageList = vm.showableChat
        guard indexPath.section + 1 < messageList.count else { return false }
        return messageList[indexPath.section].sentBy == messageList[indexPath.section + 1].sentBy
    }

    func isPreviousMessageSameSender(at indexPath: IndexPath) -> Bool {
        guard let vm = viewModel else { return false }
        let messageList = vm.showableChat
        let previousIndex = indexPath.section - 1
        guard previousIndex >= 0, previousIndex < messageList.count else { return false }
        return messageList[indexPath.section].sentBy == messageList[previousIndex].sentBy
    }

    func currentSender() -> SenderType {
        if let vm = viewModel {
            return vm.currentUser
        } else {
            return MockData.chatViewModel.currentUser
        }
    }
}

// MARK: - MessagesDataSource

extension ChatViewController: MessagesDataSource {
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        viewModel?.showableChat.count ?? 0
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        var msg = viewModel?.showableChat[indexPath.section] ?? Message(text: "", sentBy: MockData.currentUser, messageId: "", date: Date())
        
        if case MessageKind.text(let value) = msg.kind {
            let attributes: [NSAttributedString.Key : Any] = [
                NSAttributedString.Key.font : UIFont(name: PoppinsFontStyle.regular.name, size: 14.0) as Any,
                NSAttributedString.Key.foregroundColor : isFromCurrentSender(message: msg) ? Asset.Colors.pureWhite.color : Asset.Colors.darkBlue.color
                ]
            msg.kind = MessageKind.attributedText(NSAttributedString(string: value, attributes: attributes))
        }
        return msg
    }
    
    func messageBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        if !isPreviousMessageSameSender(at: indexPath),
           let message = message as? Message {
            return NSAttributedString(
                string: viewModel?.showableDateTime(of: message) ?? "",
                attributes: [
                    NSAttributedString.Key.font: UIFont(name: PoppinsFontStyle.regular.name, size: 10.0) as Any,
                    NSAttributedString.Key.foregroundColor: Asset.Colors.captionGray.color
                ])
        }
        return nil
    }
}

// MARK: - MessagesLayoutDelegate
extension ChatViewController: MessagesLayoutDelegate {
    
    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
    
    func cellBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
    
    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
    
    func messageBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return !isPreviousMessageSameSender(at: indexPath) ? 16 : 0
    }
}

// MARK: - MessagesDisplayDelegate
extension ChatViewController: MessagesDisplayDelegate {
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? Asset.Colors.halfBaked.color : Asset.Colors.disableGray.color
    }
    
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        if isPreviousMessageSameSender(at: indexPath) {
            return .bubble
        } else {
            let tail: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
            return .bubbleTail(tail, .curved)
        }
    }
    
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        avatarView.isHidden = true
    }
}
