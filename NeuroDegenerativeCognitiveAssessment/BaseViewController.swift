//
//  BaseViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 09.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    func show(error: Error) {
        let alert = UIAlertController(title: String.Error.error, message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: String.Error.ok, style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
