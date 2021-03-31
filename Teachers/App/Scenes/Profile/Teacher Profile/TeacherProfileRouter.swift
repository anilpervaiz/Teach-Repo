//
//  TeacherProfileRouter.swift
//  Teachers
//
//  Created by Rahim on 30/03/2021.
//

import Foundation

class TeacherProfileRouter: BaseRouter {
    @objc
    func didTapBillingInformationView() {

    }

    @objc
    func didTapDocumentView() {

    }

    @objc
    func didTapWalletView() {

    }

    @objc
    func didTapReviewView() {
        let viewController = ReviewsViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }  

    @objc
    func didTapSessionView() {
        let viewController = ScheduleListingSceneBuilder().makeViewController().topViewController!
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc
    func didTapAvailabilityView() {
        let viewController = AvailibilityViewController.getInstance()
        viewController.viewModel = AvailibilityViewModel()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc
    func didTapSubjectsView() {
        let viewController = RegisteredSubjectsViewController.getInstance()
        let viewModel = RegisteredSubjectsViewModel()
        viewModel.subjects = [Subject.mockData]
        viewController.viewModel = viewModel
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
}
