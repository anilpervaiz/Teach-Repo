//
//  ChatViewController.swift
//  Teachers
//

import Foundation
import UIKit

class ChatViewController: BaseViewController {
    
    @IBOutlet weak var parentImageView: UIImageView!
    @IBOutlet weak var parentName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ChatViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChatHeader()
        setupTableView()
        configureUI()
        navigationController?.navigationBar.barStyle = .default
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        parentImageView.circular = true
    }
    
    private func setupChatHeader() {
        let chatHeader = ChatHeaderView(frame: CGRect(x: 0, y: 0, width: 200, height: 48))
        navigationItem.titleView = chatHeader
    }

    private func setupTableView() {
        tableView.registerNibCell(with: ChatMessageSentCell.self)
        tableView.registerNibCell(with: ChatMessageReceivedCell.self)
        tableView.dataSource = self
    }

    private func configureUI() {
        guard let vm = viewModel else {
            return
        }
        if !vm.parentImageName.isEmpty {
            parentImageView.image = UIImage(named: vm.parentImageName)
        }
        parentName.text = vm.parentName
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MockData.chat.chatMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatMessage = MockData.chat.chatMessages[indexPath.row]
        if chatMessage.type == .received {
            let cell = tableView.dequeueReusableCell(withType: ChatMessageReceivedCell.self, for: indexPath)
            cell.configure(text: chatMessage.text)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withType: ChatMessageSentCell.self, for: indexPath)
            cell.configure(text: chatMessage.text)
            return cell
        }
    }
}
