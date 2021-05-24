//
//  UIView.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 16.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

extension UIView {
    func drawCircle() {
        let cornerRadius = bounds.size.height / 2
        layer.cornerRadius = cornerRadius
        layer.borderWidth = 7
        layer.borderColor = UIColor.blue.cgColor
    }
}
