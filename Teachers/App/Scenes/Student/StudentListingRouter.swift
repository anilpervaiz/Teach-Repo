//
//  StudentListingRouter.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

class StudentListingRouter: BaseRouter {

    func navigateToNotificationView() {
        let viewController = NotificationViewController.getInstance()
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToChatView() {

    }

    func navigateToSearch() {
        
    }
}
