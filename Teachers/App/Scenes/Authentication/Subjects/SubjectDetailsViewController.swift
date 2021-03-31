//
//  SubjectDetailsViewController.swift
//  Teachers

import Foundation
import UIKit

class SubjectDetailsViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.registerNibCell(with: RateStudentTableViewCell.self)
            tableView.registerNibCell(with: SessionFeesCell.self)
        }
    }
}

extension SubjectDetailsViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .subjects }
}

extension SubjectDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //viewModel?.numberOfItems ?? 0
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withType: RateStudentTableViewCell.self)
        } else {
            cell = tableView.dequeueReusableCell(withType: SessionFeesCell.self)
        }

        return cell
    }
}

