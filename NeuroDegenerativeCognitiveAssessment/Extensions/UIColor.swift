//
//  UIColor.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 14.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import  UIKit

extension UIColor {
    static var green: UIColor {
        return getColor(by: String.Color.green)
    }
    
    private class func getColor(by name: String) -> UIColor {
        guard let color = UIColor(named: name) else {
            assertionFailure(String.Color.color)
            return .black
        }
        return color
    }
}
