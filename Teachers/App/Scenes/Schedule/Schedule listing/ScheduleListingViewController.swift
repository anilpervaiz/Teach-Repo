//
//  ScheduleListingViewController.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//
import UIKit

class ScheduleListingViewController: BaseViewController {

    @IBOutlet weak var calendarViewHeightConstraint: NSLayoutConstraint!
    var viewModel: ScheduleListingViewModel?
    lazy var chatNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.chat.image

        let barButton = UIBarButtonItem(customView: view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChatButton))
        view.addGestureRecognizer(gesture)
        return barButton
    }()

    lazy var notificationNavigationBarButton: UIBarButtonItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.notification.image
        view.badgeCount = 3

        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapNotificationButton))
        view.addGestureRecognizer(gesture)
        return UIBarButtonItem(customView: view)
    }()

    lazy var calendarBarButtonCustomView: NavigationBarItem = {
        let view = NavigationBarItem()
        view.itemImage = Asset.Media.listIcon.image
        view.backgroundColor = Asset.Colors.lightHalfBaked.color
        view.cornerRadius = 4
        view.tintColor = Asset.Colors.halfBaked.color
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapToggleCalendarButton))
        view.addGestureRecognizer(gesture)
        return view
    }()

    lazy var calendarToggleButton: UIBarButtonItem = {
        return UIBarButtonItem(customView: calendarBarButtonCustomView)
    }()

    @IBOutlet weak var scheduleTableView: UITableView! {
        didSet {
            scheduleTableView.delegate = self
            scheduleTableView.dataSource = self
            scheduleTableView.registerNibCell(with: SessionTableViewCell.self)
            scheduleTableView.tableFooterView = UIView()
        }
    }
    @IBOutlet weak var calendarView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }

    func setupNavigationBar() {
        if navigationController?.viewControllers.count == 1 {
            setLeftAlignNavBarTitle(with: "My Schedule",
                                    font: .init(commonFont: PoppinsFontStyle.semiBold, size: 20),
                                    textColor: Asset.Colors.darkBlue.color)
            navigationItem.rightBarButtonItems = [notificationNavigationBarButton, chatNavigationBarButton, calendarToggleButton]
        } else {
            title = "My Sessions"
        }
    }
}

extension ScheduleListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Session.mockData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: SessionTableViewCell.self)
        cell.configure(session: Session.mockData[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.didTapRequest(at: indexPath.row)
    }
}


@objc
extension ScheduleListingViewController {
    func didTapNotificationButton() {
        viewModel?.didTapNotificationButton()
    }

    func didTapChatButton() {
        viewModel?.didTapChatButton()
    }

    func didTapToggleCalendarButton() {
        switch viewModel?.calendarState {
        case .expanded: setupCollapsedCalendar()
        case .collapsed: setupExpandedCalendar()
        default: break
        }
    }

    func setupCollapsedCalendar() {
        viewModel?.calendarState = .collapsed
        calendarBarButtonCustomView.itemImage = Asset.Media.calendarIcon.image

        calendarViewHeightConstraint.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }

    func setupExpandedCalendar() {
        viewModel?.calendarState = .expanded
        calendarBarButtonCustomView.itemImage = Asset.Media.listIcon.image
        calendarViewHeightConstraint.constant = 120
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}

extension ScheduleListingViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .schedule }
}
