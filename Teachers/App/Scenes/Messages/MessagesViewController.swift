//
//  MessagesViewController.swift
//  Teachers
//

import UIKit

class MessagesViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        tableView.dataSource = self
        tableView.registerNibCell(with: MessageCell.self)
        tableView.separatorStyle = .none
    }
    
    private func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: Asset.Media.search.image,
            style: .plain,
            target: self,
            action: #selector(searchTapped)
        )
    }
    
    @objc
    private func searchTapped() {
        print("search tapped on Messages screen")
    }
}

extension MessagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        MockData.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: MessageCell.self)
        cell.configure(from: MockData.messages[indexPath.row])
        return cell
    }
}

extension MessagesViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .message }
}
