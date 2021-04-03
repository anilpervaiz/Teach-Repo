//
//  SubjectDetailsViewModel.swift
//  Teachers
//

import Foundation

class SubjectDetailsViewModel {
    let studentParentDetailsViewModel: StudentParentDetailsViewModel
    let subjectDetailTableViewModel: SubjectDetailTableViewModel
    let dateAndTimeTableViewModel: DateAndTimeTableViewModel
    let paymentMethodTableViewModel: PaymentMethodTableViewModel
    let sessionFeesViewModel: SessionFeesViewModel
    private let router: SubjectRouter
    
    init(
        router: SubjectRouter,
        studentParentDetailsViewModel: StudentParentDetailsViewModel,
         subjectDetailTableViewModel: SubjectDetailTableViewModel,
         dateAndTimeTableViewModel: DateAndTimeTableViewModel,
         paymentMethodTableViewModel: PaymentMethodTableViewModel,
         sessionFeesViewModel: SessionFeesViewModel
    ) {
        self.router = router
        self.studentParentDetailsViewModel = studentParentDetailsViewModel
        self.subjectDetailTableViewModel = subjectDetailTableViewModel
        self.dateAndTimeTableViewModel = dateAndTimeTableViewModel
        self.paymentMethodTableViewModel = paymentMethodTableViewModel
        self.sessionFeesViewModel = sessionFeesViewModel
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
        
//        func className() -> AnyClass {
//            switch self {
//            case .studentParent:
//                return StudentParentDetailsTableViewCell.self
//            case .rateStudent:
//                return RateStudentTableViewCell.self
//            case .sessionFees:
//                return SessionFeesCell.self
//            }
//        }
    }
}

extension SubjectDetailsViewModel {
    static var mock = SubjectDetailsViewModel(
        router: SubjectRouter(),
        studentParentDetailsViewModel: .mock,
        subjectDetailTableViewModel: .mock,
        dateAndTimeTableViewModel: .mock,
        paymentMethodTableViewModel: .mock,
        sessionFeesViewModel: .mock
    )
}
