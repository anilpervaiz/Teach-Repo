//
//  CreateProfileViewModel.swift
//  Teachers
//
//  Created by Rahim on 20/03/2021.
//

import Foundation

class CreateProfileViewModel {
    var router: CreateProfileRouter
    var sectionViewModels: [CreateProfileSectionTableCellViewModel] = []

    var numberOfRows: Int {
        sectionViewModels.count
    }

    init(router: CreateProfileRouter) {
        self.router = router
        setupData()
    }

    func setupData() {
        sectionViewModels = ProfileSection.allCases.map {
            CreateProfileSectionTableCellViewModel(section: $0)
        }
    }

    func section(at index: Int) -> CreateProfileSectionTableCellViewModel {
        return sectionViewModels[index]
    }

    func didTapSection(at index: Int) {
        let section = sectionViewModels[index].section
        switch section {
        case .personalInformation:
            break
        case .subjects:
            router.navigateToRegisterSubject()
        case .availability:
            break
        case .paymentMethod:
            break
        case .idCard:
            break
        case .teachingLicense:
            break
        case .video:
            break
        }
    }
}
