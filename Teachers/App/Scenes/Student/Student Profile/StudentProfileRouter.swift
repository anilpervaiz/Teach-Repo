//
//  StudentProfileRouter.swift
//  Teachers
//
//  Created by Rahim on 27/03/2021.
//

import Foundation

class StudentProfileRouter: BaseRouter {

    func navigateToChat() {

    }

    func navigateToWriteAReview() {
        let viewController = RateAndReviewBuilder().makeViewController()
        navigationController?.topViewController?.present(viewController, animated: true, completion: nil)
    }
}
