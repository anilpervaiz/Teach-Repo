//
//  ScheduleListingRouter.swift
//  Teachers
//
//  Created by Rahim on 28/03/2021.
//

import Foundation

class ScheduleListingRouter: BaseRouter {

    func navigateToNotificationView() {
        let viewController = NotificationViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToChatView() {
        let viewController = MessagesListViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToSessionDetail() {
        let viewController = SessionDetailBuilder().makeViewController(navigationController: navigationController, sessionState: .accepted)
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didEndedSession() {
        let viewController = SessionEndNoteViewController.getInstance()

        navigationController?.pushViewController(viewController, animated: true)
    }
}
