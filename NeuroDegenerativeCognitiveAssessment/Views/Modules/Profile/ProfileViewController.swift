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
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var output: ProfileViewOutput!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        output = ProfilePresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.fillProfile()
    }
    
    func displayProfile(profile: Profile) {
        nameLabel.text = profile.name
        ageLabel.text = profile.age.description
        emailLabel.text = profile.email
    }
    
    @IBAction func deleteProfile(_ sender: Any) {
        showWarning()
    }
    
    func showWarning() {
        let alert = UIAlertController(title: String.Warning.warning, message: String.Warning.wantToErseData, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: String.Warning.cancel, style: .default, handler: nil)
        let eraseAction = UIAlertAction(title: String.Warning.erase, style: .default, handler: { action in
            self.output.deleteProfile()
            AppRouter.shared.openModule(type: .fillingProfile)
            
        })
        alert.addAction(eraseAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
}
