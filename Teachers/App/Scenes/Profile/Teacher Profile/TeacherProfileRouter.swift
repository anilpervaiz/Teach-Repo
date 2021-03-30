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

    }

    @objc
    func didTapSessionView() {

    }

    @objc
    func didTapAvailabilityView() {

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
