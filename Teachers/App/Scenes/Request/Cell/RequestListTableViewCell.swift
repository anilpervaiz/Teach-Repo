//
//  RequestListTableViewCell.swift
//  Teachers
//
//  Created by Rahim on 25/03/2021.
//

import UIKit

class RequestListTableViewCell: UITableViewCell,
                                ReusableView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sessionStateView: UIView!
    @IBOutlet weak var sessionState: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var sessionTimeLabel: UILabel!
    @IBOutlet weak var sessionModeImageView: UIImageView!
    @IBOutlet weak var sessionModeLabel: UILabel!

    func configure(session: Session) {
        var session = session
        titleLabel.text = "\(session.subject)-\(session.curriculum)"
        sessionState.text = session.state.title
        sessionState.textColor = session.state.titleColor.color
        sessionStateView.backgroundColor = session.state.backgroundColor.color
        profileImageView.image = UIImage(named:session.user.profileImage)
        userNameLabel.text = session.user.name
        sessionModeLabel.text = session.medium.title
        sessionModeImageView.image = session.medium.icon.image
        sessionModeLabel.textColor = session.medium.themeColor.color
        sessionTimeLabel.text = session.sessionDate
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = ""
        sessionState.text = ""
        sessionState.textColor = .clear
        sessionStateView.backgroundColor = .clear
        profileImageView.image = nil
        userNameLabel.text = ""
        sessionModeLabel.text = ""
        sessionModeImageView.image = nil
        sessionModeLabel.textColor = .clear
        sessionTimeLabel.text = ""
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        sessionStateView.circular = true
        profileImageView.circular = true
    }
}
