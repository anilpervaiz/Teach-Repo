//
//  SignupCompletedSuccessStateViewModel.swift
//  Teachers
//
//  Created by Rahim on 18/03/2021.
//

import Foundation

struct SignupCompletedSuccessStateViewModel: SuccessStateViewModel {
    var router: SignupSuccessStateRouter
    var title: String = "Thank You!"
    var message: String = "Now you need to complete your profile to be able to join Edukko family."
    var imageName: String?

    func didTapCTAButton() {
        router.navigateToCreateProfile()
    }
}
