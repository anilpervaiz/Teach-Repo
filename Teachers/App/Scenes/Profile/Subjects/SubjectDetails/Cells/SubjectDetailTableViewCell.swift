//
//  SubjectDetailTableViewCell.swift
//  Teachers
//

import Foundation
import UIKit

class SubjectDetailTableViewCell: UITableViewCell, ReusableView {
    @IBOutlet weak var subjectThumbnailImageView: UIImageView!
    @IBOutlet weak var subjectNameLabel: UILabel!
    @IBOutlet weak var subjectDetailLabel: UILabel!
    
    func configure(with viewModel: SubjectDetailTableViewModel) {
        subjectThumbnailImageView.image = viewModel.subjectThumbnailImage
        subjectNameLabel.text = viewModel.subjectName
        subjectDetailLabel.text = viewModel.subjectDetail
    }
}

struct SubjectDetailTableViewModel {
    let subjectThumbnailImage: UIImage
    let subjectName: String
    let subjectDetail: String
}

extension SubjectDetailTableViewModel {
    static var mock = SubjectDetailTableViewModel(
        subjectThumbnailImage: Asset.Media.subject.image, subjectName: "History", subjectDetail: "American Curriculum - Grade 6")
}
