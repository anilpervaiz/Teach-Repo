//
//  NavigationBarItem.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class NavigationBarItem: CustomNibView {

    @IBOutlet private weak var badgeView: UIView!
    @IBOutlet private weak var badgeLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!

    var itemImage: UIImage? = nil {
        didSet {
            imageView?.image = itemImage
        }
    }
    var badgeCount: Int = 0 {
        didSet {
            if badgeCount > 0 {
                badgeLabel?.text = "\(badgeCount)"
                badgeView?.isHidden = false
            } else {
                badgeLabel?.text = ""
                badgeView?.isHidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setupView() {
        imageView.image = itemImage

        if badgeCount > 0 {
            badgeLabel.text = "\(badgeCount)"
            badgeView.isHidden = false
        } else {
            badgeLabel.text = ""
            badgeView.isHidden = true
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        badgeView.circular = true
    }
}
