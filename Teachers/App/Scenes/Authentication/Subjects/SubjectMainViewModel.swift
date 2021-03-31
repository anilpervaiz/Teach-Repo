//
//  SubjectMainViewModel.swift
//  Teachers
//

import Foundation

struct SubjectMainViewModel {
    let subjectName: String
    let subjectDetail: String
    let subjectDetalsViewModel: SubjectDetailsViewModel
    let subjectDocumentsViewModel: DocumentsViewModel
}

extension SubjectMainViewModel {
    static var mock = SubjectMainViewModel(
        subjectName: "Math",
        subjectDetail: "American Curriculum",
        subjectDetalsViewModel: .mock,
        subjectDocumentsViewModel: .mock
    )
}
