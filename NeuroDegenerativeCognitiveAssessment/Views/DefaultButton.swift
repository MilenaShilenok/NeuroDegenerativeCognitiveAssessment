//
//  File.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 14.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class DefaultButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        backgroundColor = UIColor.green
        setTitleColor(UIColor.white, for: .normal)
    }
}

