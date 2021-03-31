//
//  DocumentsViewController.swift
//  Teachers

import Foundation
import UIKit

class DocumentsViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.registerNibCell(with: RateStudentTableViewCell.self)
            tableView.registerNibCell(with: DocumentCell.self)
        }
    }
}

extension DocumentsViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .subjects }
}

extension DocumentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //viewModel?.numberOfItems ?? 0
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: DocumentCell.self)
        return cell
    }
}

