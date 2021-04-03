//
//  SubjectBuilder.swift
//  Teachers
//

import Foundation

struct SubjectBuilder {
    func makeViewController(navigationController: BaseNavigationController?) -> SubjectMainViewController {
        let viewController = SubjectMainViewController.getInstance()
        let router = SubjectRouter(with: navigationController)
        let subjectDetailsViewModel = SubjectDetailsViewModel(
            router: router,
            studentParentDetailsViewModel: .mock,
            subjectDetailTableViewModel: .mock,
            dateAndTimeTableViewModel: .mock,
            paymentMethodTableViewModel: .mock,
            sessionFeesViewModel: .mock
        )
        
        let documentsViewModel = DocumentsViewModel(router: router,
            documents: [
            DocumentCellViewModel(documentType: .doc, name: "Doc..Name.doc", sizeAndDate: "12 MB • Yesterday", onMoreOptionsTapped: {
                print("more options tapped for document Doc..Name.doc")
            }),
            DocumentCellViewModel(documentType: .jpg, name: "Doc..Name.jpg", sizeAndDate: "12 MB • Yesterday", onMoreOptionsTapped: {
                print("more options tapped for document Doc..Name.jpg")
            }),
            DocumentCellViewModel(documentType: .mp4, name: "Doc..Name.mp4", sizeAndDate: "12 MB • Yesterday", onMoreOptionsTapped: {
                print("more options tapped for document Doc..Name.mp4")
            }),
            DocumentCellViewModel(documentType: .pdf, name: "Doc..Name.pdf", sizeAndDate: "12 MB • Yesterday", onMoreOptionsTapped: {
                print("more options tapped for document Doc..Name.pdf")
            }),
            DocumentCellViewModel(documentType: .zip, name: "Doc..Name.zip", sizeAndDate: "12 MB • Yesterday", onMoreOptionsTapped: {
                print("more options tapped for document Doc..Name.zip")
            }),
        ]) {
            print("New Document Tapped")
        }
        
        viewController.viewModel = SubjectMainViewModel(with: router,
                                                        subjectName: "Math",
                                                        subjectDetail: "American Curriculum",
                                                        subjectDetalsViewModel: subjectDetailsViewModel,
                                                        subjectDocumentsViewModel: documentsViewModel
        )

        return viewController
    }
}
