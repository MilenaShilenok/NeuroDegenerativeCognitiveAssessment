//
//  UIView+GestureRecognizer.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 05.05.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

extension UIViewController {
    func addTapGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapped))
        view.addGestureRecognizer(tap)
    }
    
    @objc func didTapped() {
        view.endEditing(true)
    }
}
