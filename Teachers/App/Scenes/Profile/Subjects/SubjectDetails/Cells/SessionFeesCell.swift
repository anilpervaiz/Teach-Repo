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

struct SessionFeesViewModel: SubjectDetailTableCellViewModel {
    let hoursValue: String
    let totalValue: String
}
