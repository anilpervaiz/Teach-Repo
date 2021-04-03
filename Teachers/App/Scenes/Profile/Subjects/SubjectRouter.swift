//
//  SubjectRouter.swift
//  Teachers
//

import Foundation

class SubjectRouter: BaseRouter {
    func navigateToChatView() {
        let viewController = ChatViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        viewController.viewModel = MockData.chatViewModelWithoutParentInfo
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigateToAddNewDocument() {
        
    }
}
