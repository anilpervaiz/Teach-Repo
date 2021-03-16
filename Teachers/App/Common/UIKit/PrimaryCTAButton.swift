//
//  PrimaryCTAButton.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

class PrimaryCTAButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    func setupStyle() {
        titleLabel?.font = .init(commonFont: PoppinsFontStyle.semiBold, size: 14)
        setTitleColor(Asset.Colors.primary.color, for: .normal)
        backgroundColor = Asset.Colors.aquaMarine.color
        cornerRadius = 4
        
    }
}
