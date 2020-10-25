//
//  InputViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 04.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class EntryViewController: UIViewController, EntryViewInput {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var output: EntryViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = EntryPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        nameTextField.text = ""
        ageTextField.text = ""
        emailTextField.text = ""
    }
    
    @IBAction func saveProfileButton(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let age = Int(ageTextField.text ?? "") ?? 0
       
        let profile = Profile(name: name, age: age, email: email)
        output.save(profile: profile)
        
        AppRouter.shared.openModule(type: .profile)
    }
}
