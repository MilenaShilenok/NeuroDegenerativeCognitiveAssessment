//
//  EditProfileViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 10.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class EditProfileViewController: UIViewController, EditViewInput {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var output: EditViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = EditProfilePresenter(view: self)
        output.fillProfile()
    }
    
    func fillProfile(with profile: Profile) {
        nameTextField.text = profile.name
        ageTextField.text = profile.age.description
        emailTextField.text = profile.email
    }
    
    @IBAction func editProfile(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let age = Int(ageTextField.text ?? "") ?? 0
        let email = emailTextField.text ?? ""
        let profile = Profile(name: name, age: age, email: email)
        
        do {
            try output.edit(profile: profile)
            navigationController?.popViewController(animated: true)
        } catch {
            show(error: error)
        }
    }
}
