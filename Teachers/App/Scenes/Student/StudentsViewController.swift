//
//  StudentsListingViewController.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class StudentsListingViewController: BaseViewController {


    var viewModel: StudentListingViewModel?

    lazy var chatNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.chat.image

        let barButton = UIBarButtonItem(customView: view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChatButton))
        view.addGestureRecognizer(gesture)
        return barButton
    }()

    lazy var searchBarButton: UIBarButtonItem = {
        return UIBarButtonItem(
            image: Asset.Media.search.image,
            style: .plain,
            target: self,
            action: #selector(didTapSearchButton)
        )
    }()

    lazy var notificationNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.notification.image
        view.badgeCount = 3

        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapNotificationButton))
        view.addGestureRecognizer(gesture)
        return UIBarButtonItem(customView: view)
    }()

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNibCell(with: StudentTableViewCell.self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        navigationController?.navigationBar.barStyle = .default
    }

    func setupNavigationBar() {
        setLeftAlignNavBarTitle(with: "Students",
                                font: .init(commonFont: PoppinsFontStyle.semiBold, size: 20),
                                textColor: Asset.Colors.darkBlue.color)
        navigationItem.rightBarButtonItems = [notificationNavigationBarButton, chatNavigationBarButton, searchBarButton]
    }
}

extension StudentsListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Student.mockData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: StudentTableViewCell.self)
        cell.configure(student: Student.mockData[indexPath.row])
        return cell
    }
}

@objc
extension StudentsListingViewController {
    func didTapNotificationButton() {
        viewModel?.didTapNotificationButton()
    }

    func didTapChatButton() {
        viewModel?.didTapChatButton()
    }

    func didTapSearchButton() {
        viewModel?.didTapSeachButton()
    }
}

extension StudentsListingViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .student }
}
