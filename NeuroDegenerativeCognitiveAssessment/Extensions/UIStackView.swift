//
//  UIStackView.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 18.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    func addButton(count: Int) {
        for i in 1...count {
            let button = ButtonForQuiz(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            button.backgroundColor = UIColor.blue
            button.setTitle(i.description, for: .normal)
            addArrangedSubview(button)
        }
    }
}
