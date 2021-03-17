//
//  BaseViewController.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardOnTappingOutsideArea()
        setBackButtonStyle()
    }

    private func setBackButtonStyle() {

        navigationController?.navigationBar.tintColor = Asset.Colors.gray.color
        let navController = navigationController as? BaseNavigationController
        removeBackButtonTitleOfPushedController()
        navController?.applyCustomBackButtonStyle()
    }

    /// Call this method on the pushing view Controller.
    func removeBackButtonTitleOfPushedController() {
        navigationItem.backBarButtonItem = .empty
    }
}
