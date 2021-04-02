//
//  SessionFeesCell.swift
//  Teachers

import Foundation
import UIKit

class SessionFeesCell: UITableViewCell, ReusableView {
    
    @IBOutlet weak var hoursValueLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    
    func configure(with viewModel: SessionFeesViewModel) {        
        hoursValueLabel.text = viewModel.hoursValue
        totalValueLabel.text = viewModel.totalValue
    }
}

struct SessionFeesViewModel {
    let hoursValue: String
    let totalValue: String
}

extension SessionFeesViewModel {
    static var mock = SessionFeesViewModel(hoursValue: "2 Hours", totalValue: "AED 80")
}


