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
        /*guard let age = Int(ageTextField.text ?? "") else {
            show(error: SystemError.custom("error"))
        }*/
        
        output.save(name: name, age: age, email: email)
        
    }
    
    func show(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
