//
//  NumberVerificationViewController.swift
//  Teachers
//
//  Created by Rahim on 17/03/2021.
//

import UIKit
import SVPinView

class NumberVerificationViewController: BaseViewController {

    @IBOutlet weak var pinView: SVPinView! {
        didSet {
            pinView.style = .box
            pinView.font = .init(commonFont: PoppinsFontStyle.semiBold, size: 20)
            pinView.keyboardType = .phonePad
            pinView.becomeFirstResponderAtIndex = 0
            pinView.placeholder = "00000"
            pinView.tintColor = .clear
            pinView.didFinishCallback = { pin in
                print("Here's your pin")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
