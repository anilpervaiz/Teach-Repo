//
//  OnboardingViewController.swift
//  Teachers
//
//  Created by Rahim on 15/03/2021.
//

import UIKit

class OnboardingViewController: BaseViewController {

    private lazy var termsAndConditionAttributedString: NSAttributedString = {

        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center

        let string = "By continuing you accept our Terms & Conditions."

        let attributedString = NSMutableAttributedString(string: string, attributes: [
            .font: UIFont.init(commonFont: PoppinsFontStyle.regular, size: 12),
            .foregroundColor: Asset.Colors.sapphireLight.color,
            .paragraphStyle: style
        ])

        attributedString.apply(color: Asset.Colors.aquaMarine.color,
                               subString: "Terms & Conditions")
        attributedString.apply(font: UIFont(commonFont: PoppinsFontStyle.medium, size: 12),
                               subString: "Terms & Conditions")

        return attributedString
    }()

    @IBOutlet weak var termsAndConditionLabel: UILabel! {
        didSet {
            termsAndConditionLabel.isUserInteractionEnabled = true
            termsAndConditionLabel.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                               action: #selector(labelTapped(gesture:))))
            termsAndConditionLabel.attributedText = termsAndConditionAttributedString
        }
    }
}

// MARK: - label section tapped handling.
extension OnboardingViewController {
    @objc func labelTapped(gesture: UITapGestureRecognizer) {
        guard let text = termsAndConditionLabel.text,
              let termsRange = text.range(of: "Terms & Conditions") else {
            return
        }
        let termsNSRange = NSRange(termsRange, in: text)

        if termsAndConditionLabel.isTapGesture(gesture,
                                               inRange: termsNSRange) {
            // Perform Terms and condition navigation
            print("Terms and condition tapped")
        }
    }
}
