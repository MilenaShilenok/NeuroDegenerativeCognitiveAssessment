//
//  TabBarController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 05.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set center tab as initial
        let centerTabController = 2
        self.selectedIndex = centerTabController
    }
}
