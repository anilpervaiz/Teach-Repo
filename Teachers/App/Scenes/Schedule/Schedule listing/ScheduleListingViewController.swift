//
//  ScheduleListingViewController.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class ScheduleListingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension ScheduleListingViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .schedule }
}
