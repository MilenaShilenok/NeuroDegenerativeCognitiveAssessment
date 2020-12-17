//
//  Double.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 29.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    mutating func roundUp(numberOfDecimalPlaces: Int) {
        let count = pow(10.0, Double(numberOfDecimalPlaces))
        self = self * count
        self.round()
        self /= count
    }
}
