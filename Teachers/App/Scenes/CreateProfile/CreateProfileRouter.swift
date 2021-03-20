//
//  CreateProfileRouter.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import Foundation

class CreateProfileRouter: BaseRouter {

    func navigateToRegisterSubject() {
        let viewController = RegisteredSubjectsViewController.getInstance()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
