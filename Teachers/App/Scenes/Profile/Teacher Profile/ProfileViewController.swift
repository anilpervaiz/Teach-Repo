//
//  ProfileViewController.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class ProfileViewController: BaseViewController {

    var mockData: User = User.mockData

    @IBOutlet weak var billingInformationView: UIView!
    @IBOutlet weak var documentLibraryView: UIView!
    @IBOutlet weak var walletView: UIView!
    @IBOutlet weak var reviewsView: UIView!
    @IBOutlet weak var mySessionsView: UIView!
    @IBOutlet weak var availabilityView: UIView!
    @IBOutlet weak var subjectsView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        navigationController?.navigationBar.barStyle = .blackTranslucent
    }

    func setupData() {
        profileImageView.image = UIImage(named: mockData.profileImage)
        nameLabel.text = mockData.name
        ratingLabel.text = "\(mockData.rating)"
    }

    override func viewDidLayoutSubviews() {
        profileImageView.circular = true
        editButton.circular = true
        settingsButton.circular = true
    }

    @IBAction func didTapEditButton(_ sender: Any) {
    }

    @IBAction func didTapSettingsButton(_ sender: Any) {
        let viewController = SettingsViewController.getInstance()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

@objc
extension ProfileViewController {
    func didTapBillingInformationView() {

    }

    func didTapDocumentView() {

    }

    func didTapWalletView() {

    }

    func didTapReviewView() {

    }

    func didTapSessionView() {

    }

    func didTapAvailabilityView() {

    }

    func didTapSubjectsView() {

    }
}

extension ProfileViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .profile }
}
