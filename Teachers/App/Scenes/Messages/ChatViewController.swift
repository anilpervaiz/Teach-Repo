//
//  ChatViewController.swift
//  Teachers
//

import UIKit

class ChatViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChatHeader()
    }
    
    func setupChatHeader() {
        let chatHeader = ChatHeaderView(frame: CGRect(x: 0, y: 0, width: 200, height: 48))
        navigationItem.titleView = chatHeader
    }
}
