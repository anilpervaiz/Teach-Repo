//
//  SignupPersonalInformationViewController.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

class SignupPersonalInformationViewController: BaseViewController {

    lazy var optionSelectionView: OptionSelectionView<GenderOption> = {
        let view = OptionSelectionView<GenderOption>().preparedForAutolayout()
        view.configure(with: GenderOption.allCases, title: "Gender")
        return view
    }()

    @IBOutlet weak var optionSelectionContainerView: UIView! {
        didSet {
            optionSelectionContainerView.addSubview(optionSelectionView)
            optionSelectionView.fillSuperview()
        }
    }
}

enum GenderOption: String,
                   OptionCaseIterable {
    case male = "male"
    case female = "female"

    var title: String {
        switch self {
        case .male: return "Male"
        case .female: return "Female"
        }
    }

    var imageName: String {
        switch self {
        case .male: return Asset.Media.male.name
        case .female: return Asset.Media.female.name
        }
    }
}
