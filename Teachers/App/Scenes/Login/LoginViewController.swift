//
//  LoginViewController.swift
//  Teachers
//
//  Created by Rahim on 19/03/2021.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var emailTextField: LabelledTextField!
    @IBOutlet weak var passwordTextField: LabelledTextField! {
        didSet {
            passwordTextField.secureEntry = true
            passwordTextField.editTextKeyboardType = .asciiCapable
            passwordTextField.trailingIconStyle = .obscure(switchIcon: Asset.Media.eyeIcon.image,
                                                           secureStateColor: Asset.Colors.gray.color,
                                                           insecureStateColor: Asset.Colors.primary.color)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }

    @IBAction func didTapFacebookLoginButton(_ sender: Any) {
        //TODO: for the purpose of demo i have linked login failed screen here
        let viewController = LoginPendingProcessViewController.getInstance()
        viewController.viewModel = LoginProfileRejectViewModel()

        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical

        self.present(viewController,
                     animated: true,
                     completion: nil)
    }

    @IBAction func didTapLoginButton(_ sender: Any) {

        let viewController = LoginPendingProcessViewController.getInstance()
        viewController.viewModel = LoginAccountWaitingReviewViewModel()

        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical

        self.present(viewController,
                     animated: true,
                     completion: nil)
    }
}
