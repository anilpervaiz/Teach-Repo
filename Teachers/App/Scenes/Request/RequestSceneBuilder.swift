//
//  RequestSceneBuilder.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import Foundation

struct RequestSceneBuilder {
    func makeViewController() -> BaseNavigationController {
        let controller = RequestsViewController.getInstance()

        return BaseNavigationController(rootViewController: controller)
    }
}
