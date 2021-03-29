//
//  SessionDetailRouter.swift
//  Teachers
//
//  Created by Rahim on 27/03/2021.
//

import Foundation

class SessionDetailRouter: BaseRouter {
    func navigateToRejectSessionRequest() {
        let viewController = RejectSessionViewController.getInstance()
        navigationController?.pushViewController(viewController, animated: true)
    }

    func navigteToSessionEndFlow() {
        let viewController = SessionEndNoteViewController.getInstance()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateToChatView() {
        let viewController = MessagesListViewController.getInstance()
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
    }
}
