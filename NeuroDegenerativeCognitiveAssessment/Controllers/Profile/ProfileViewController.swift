//
//  ProfileViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 07.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController, ProfileViewInput {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var output: ProfileViewOutput!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        output = ProfilePresenter(view: self)
    }
}
