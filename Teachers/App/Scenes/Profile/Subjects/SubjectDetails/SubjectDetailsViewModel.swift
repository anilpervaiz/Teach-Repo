//
//  SubjectDetailsViewModel.swift
//  Teachers
//

import Foundation

protocol SubjectDetailTableCellViewModel {}

class SubjectDetailsViewModel {
    lazy var studentParentDetailsViewModel: StudentParentDetailsViewModel = {
        StudentParentDetailsViewModel(
            studentImage: Asset.Media.student.image,
            studentName: "Assem Mohammed",
            parentImage: Asset.Media.studentParent.image,
            ratingImage: Asset.Media.ratingStar.image,
            rating: "4.5") { [weak self] in
            self?.router.navigateToChatView()
        }
    }()
    lazy var subjectDetailTableViewModel: SubjectDetailTableViewModel = {
        SubjectDetailTableViewModel(
            subjectThumbnailImage: Asset.Media.subject.image, subjectName: "History", subjectDetail: "American Curriculum - Grade 6")
    }()
    lazy var dateAndTimeTableViewModel: DateAndTimeTableViewModel = {
        DateAndTimeTableViewModel(
            timeImage: Asset.Media.time.image,
            date: "Monday, 4 Feb",
            time: "2:30 PM - 01:30 PM (1 hour)",
            lectureModeImage: Asset.Media.lectureMode.image
        )
    }()
    lazy var paymentMethodTableViewModel: PaymentMethodTableViewModel = {
        PaymentMethodTableViewModel(
            paymentMethodImage: Asset.Media.applePay.image,
            paymentMethod: "Apple Pay"
        )
    }()
    lazy var sessionFeesViewModel: SessionFeesViewModel = {
        SessionFeesViewModel(hoursValue: "2 Hours", totalValue: "AED 80")
    }()
    private let router: SubjectRouter
    
    init(router: SubjectRouter) {
        self.router = router
    }
    
    lazy private(set) var cells: [CellType] = [.studentParent, .rateStudent, .subject, .dateAndTime, .paymentMethod, .sessionFees]
    var numberOfCells: Int { cells.count }
    
    func cell(at index: Int) -> CellType? {
        guard index >= 0, index < numberOfCells else { return nil}
        return cells[index]
    }
    
    enum CellType {
        case studentParent
        case rateStudent
        case subject
        case dateAndTime
        case paymentMethod
        case sessionFees
    }
}
