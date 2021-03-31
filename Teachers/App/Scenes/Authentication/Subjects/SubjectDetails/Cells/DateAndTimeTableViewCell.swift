//
//  DateAndTimeTableViewCell.swift
//  Teachers
//

import Foundation
import UIKit

class DateAndTimeTableViewCell: UITableViewCell, ReusableView {
    @IBOutlet weak var timeImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var lectureModeImageView: UIImageView!

    func configure(with viewModel: DateAndTimeTableViewModel) {
        timeImageView.image = viewModel.timeImage
        dateLabel.text = viewModel.date
        timeLabel.text = viewModel.time
        lectureModeImageView.image = viewModel.lectureModeImage
    }
}

struct DateAndTimeTableViewModel {
    let timeImage: UIImage
    let date: String
    let time: String
    let lectureModeImage: UIImage
}

extension DateAndTimeTableViewModel {
    static var mock = DateAndTimeTableViewModel(
        timeImage: Asset.Media.time.image,
        date: "Monday, 4 Feb",
        time: "2:30 PM - 01:30 PM (1 hour)",
        lectureModeImage: Asset.Media.lectureMode.image
    )
        
}
