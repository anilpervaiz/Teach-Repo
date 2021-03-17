//
//  SignupMobileNumberViewController.swift
//  Teachers
//
//  Created by Rahim on 17/03/2021.
//

import UIKit
import FlagPhoneNumber

class SignupMobileNumberViewController: BaseViewController {

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

        // Do any additional setup after loading the view.
    }
}
