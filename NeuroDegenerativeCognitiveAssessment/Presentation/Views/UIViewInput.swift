//
//  UIViewInput.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 10.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

protocol UIViewInput {
    func show(error: Error, handler: (()->Void)?)
}

extension UIViewInput {
    func show(error: Error, handler: (()->Void)? = nil) {
        guard let vc = self as? UIViewController else { return }
        let alert = UIAlertController(title: String.Error.error, message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: String.Error.ok, style: .default, handler: { _ in
            handler?()
        })
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}
