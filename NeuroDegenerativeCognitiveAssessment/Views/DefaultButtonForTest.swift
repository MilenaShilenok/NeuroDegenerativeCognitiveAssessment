//
//  DefaultButtonForTest.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 21.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class DefaultButtonForTest: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        clipsToBounds = true
        
        layer.borderWidth = 2.5
        layer.borderColor = UIColor.black.cgColor
        setTitleColor(UIColor.black, for: .normal)
    }
}

