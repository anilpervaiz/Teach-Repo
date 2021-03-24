//
//  ScheduleSceneBuilder.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct ScheduleSceneBuilder {
    func makeViewController() -> BaseNavigationController {
        let controller = MyScheduleViewController.getInstance()

        return BaseNavigationController(rootViewController: controller)
    }
}
