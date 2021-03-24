//
//  StudentSceneBuilder.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct StudentSceneBuilder {
    func makeViewController() -> BaseNavigationController {
        let controller = StudentsListingViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: controller)
        controller.viewModel = StudentListingViewModel(router: StudentListingRouter(with: navigationController))
        return navigationController
    }
}
