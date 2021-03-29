//
//  StudentProfileRouter.swift
//  Teachers
//
//  Created by Rahim on 27/03/2021.
//

import Foundation

class StudentProfileRouter: BaseRouter {

    func navigateToChat() {
        let viewController = MessagesListViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToWriteAReview() {
        let viewController = RateAndReviewBuilder().makeViewController()
        navigationController?.topViewController?.present(viewController, animated: true, completion: nil)
    }
}
