//
//  MyScheduleViewController.swift
//  Teachers
//
//  Created by Rahim on 24/03/2021.
//

import UIKit

class MyScheduleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension MyScheduleViewController: Initializable {
    static var storyboardName: UIStoryboard.Name { .schedule }
}
