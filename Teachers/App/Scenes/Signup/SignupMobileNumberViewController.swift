//
//  SignupMobileNumberViewController.swift
//  Teachers
//
//  Created by Rahim on 17/03/2021.
//

import UIKit
import FlagPhoneNumber

class SignupMobileNumberViewController: BaseViewController {

    @IBOutlet weak var ctaButtonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var phoneNumberTextField: FPNTextField! {
        didSet {
            phoneNumberTextField.flagButtonSize = CGSize(width: 36, height: 36)
            phoneNumberTextField.textColor = Asset.Colors.gray.color
            phoneNumberTextField.placeHolderColor = Asset.Colors.lightGray.color
            phoneNumberTextField.trailingCodeImage = Asset.Media.downArrow.image
            phoneNumberTextField.font = .init(commonFont: PoppinsFontStyle.regular, size: 16)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupKeyboardNotification()
    }
}

extension SignupMobileNumberViewController {
    @IBAction func didTapVerifyNumberButton(_ sender: Any) {
        let viewModel = NumberVerificationViewModel()
        let viewController = NumberVerificationViewController.getInstance()

        viewController.viewModel = viewModel

        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension SignupMobileNumberViewController {
    func setupKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - Keyboard target events
@objc
extension SignupMobileNumberViewController {
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
           let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double {
            ctaButtonBottomConstraint.constant = keyboardSize.height + AppDimension.margin.medium
            UIView.animate(withDuration: duration) {
                self.view.layoutIfNeeded()
            }
        }
    }

    private func keyboardWillHide(sender: NSNotification) {
        ctaButtonBottomConstraint.constant = AppDimension.margin.medium
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
