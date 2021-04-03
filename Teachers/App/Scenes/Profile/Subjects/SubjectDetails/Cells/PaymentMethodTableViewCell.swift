//
//  PaymentMethodTableViewCell.swift
//  Teachers
//

import Foundation
import UIKit

class PaymentMethodTableViewCell: UITableViewCell, ReusableView {
    @IBOutlet weak var paymentMethodImageView: UIImageView!
    @IBOutlet weak var paymentMethodLabel: UILabel!
    
    func configure(with viewModel: PaymentMethodTableViewModel) {
        paymentMethodImageView.image = viewModel.paymentMethodImage
        paymentMethodLabel.text = viewModel.paymentMethod
    }
}

struct PaymentMethodTableViewModel: SubjectDetailTableCellViewModel {
    let paymentMethodImage: UIImage
    let paymentMethod: String
}
