//
//  DocumentCell.swift
//  Teachers

import Foundation
import UIKit

class DocumentCell: UITableViewCell, ReusableView {
    @IBOutlet weak var docThumbnailImageView: UIImageView!
    
    @IBOutlet weak var docNameLabel: UILabel!
    @IBOutlet weak var docSizeAndDateLabel: UILabel!
    
    @IBAction func moreOptionsTapped(_ sender: Any) {
    }
}
