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
    
    @IBAction func registerButton(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let age = ageTextField.text ?? ""
        /*let ageStr = Int(ageTextField.text ?? "")
         if let ageInt = ageStr {} else {
            show(error: SystemError.custom("error"))
        }*/
       
        let user = User(name: name, age: age, email: email)
        output.save(user: user)
        openNextScreen()
    }
    
    func openNextScreen() {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ProfileViewController")
        show(vc, sender: nil)
        //present(vc, animated: true, completion: nil)
    }
    
    func show(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
