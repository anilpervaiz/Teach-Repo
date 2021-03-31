//
//  SubjectMainViewController.swift
//  Teachers

import Foundation
import UIKit

class SubjectMainViewController: BaseViewController {    
    @IBOutlet weak var subjectNameLabel: UILabel!
    @IBOutlet weak var subjectDetailLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var divider: UIView!
    
    lazy private var subjectDetailViewController = SubjectDetailsViewController.getInstance()
    lazy private var documentsViewController = DocumentsViewController.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentedControl()
        updateView()
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        updateView()
    }
}

// Mark - Private Methods
extension SubjectMainViewController {
    func setupSegmentedControl() {
        let notSelectedAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont(name: PoppinsFontStyle.medium.name, size: 12) as Any,
            NSAttributedString.Key.foregroundColor : Asset.Colors.gray.color
        ]
        let selectedAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont(name: PoppinsFontStyle.semiBold.name, size: 12) as Any,
            NSAttributedString.Key.foregroundColor : Asset.Colors.aquaMarine.color
        ]

        segmentedControl.setTitleTextAttributes(notSelectedAttributes, for: .normal)
        segmentedControl.setTitleTextAttributes(selectedAttributes, for: .selected)
    }
    
    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: documentsViewController)
            add(asChildViewController: subjectDetailViewController)
        } else {
            remove(asChildViewController: subjectDetailViewController)
            add(asChildViewController: documentsViewController)
        }
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        let childView: UIView! = viewController.view
        view.addSubview(childView)

        // Configure Child View
        childView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.topAnchor.constraint(equalTo: divider.bottomAnchor),
            childView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            childView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            childView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }
}

extension SubjectMainViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .subjects }
}

extension SubjectMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //viewModel?.numberOfItems ?? 0
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: RegisteredSubjectTableViewCell.self)
        return cell
    }    
}
