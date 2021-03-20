//
//  RegisteredSubjectsViewController.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import UIKit

class RegisteredSubjectsViewController: BaseViewController {

    @IBOutlet weak var illustrationImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        title = "Subjects"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }

    func setupBarButtonItem() {

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        illustrationImageView.circular = true
    }

    @IBAction func didTapAddSubjectButton(_ sender: Any) {
        let viewController = BottomSheet.getInstance()
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = .crossDissolve
        viewController.viewModel = BottomSheetViewModel(with: "Education Type", items: [
            BottomSheetListCellViewModel(isSelected: false, title: "Kindergarten"),
            BottomSheetListCellViewModel(isSelected: false, title: "Kindergarten"),
            BottomSheetListCellViewModel(isSelected: true, title: "Kindergarten"),
        ])
        present(viewController, animated: true, completion: nil)
    }
}

extension RegisteredSubjectsViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .createProfile }
}
