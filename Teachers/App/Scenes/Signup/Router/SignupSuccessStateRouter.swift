//
//  SignupSuccessStateRouter.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import UIKit

class SignupSuccessStateRouter: BaseRouter {

    weak var topViewController: BaseViewController?

    init(with topViewController: BaseViewController?) {
        self.topViewController = topViewController
    }

    func navigateToCreateProfile() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let window = appDelegate?.window else { return }
        // Animatedly update root view controller
        let viewController = CreateProfileViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: viewController)

        viewController.viewModel = CreateProfileViewModel(router: CreateProfileRouter(with: navigationController))
        window.switchRoot(to: navigationController)
    }

    func navigateToGetStarted() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let window = appDelegate?.window else { return }
        // Animatedly update root view controller
        guard let viewController = UIStoryboard(name: "GetStarted", bundle: .main).instantiateInitialViewController() else { return }
        window.switchRoot(to: viewController)
    }
}
