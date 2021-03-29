//
//  ScheduleListingSceneBuilder.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct ScheduleListingSceneBuilder {
    func makeViewController() -> BaseNavigationController {
        let controller = ScheduleListingViewController.getInstance()
        let navigationController = BaseNavigationController(rootViewController: controller)
        controller.viewModel = .init(router: .init(with: navigationController))
        return navigationController
    }
}
