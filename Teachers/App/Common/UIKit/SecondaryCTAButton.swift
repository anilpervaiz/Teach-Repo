//
//  SecondaryCTAButton.swift
//  Teachers
//
//  Created by Rahim on 16/03/2021.
//

import UIKit

class SecondaryCTAButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyle()
    }

    func setupStyle() {
        titleLabel?.font = .init(commonFont: PoppinsFontStyle.semiBold, size: 14)
        backgroundColor = .clear
        cornerRadius = 4
        borderWidth = 1
        borderColor = Asset.Colors.aquaMarine.color
        setTitleColor(Asset.Colors.aquaMarine.color, for: .normal)
    }
}
