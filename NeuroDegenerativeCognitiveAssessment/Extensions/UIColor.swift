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
        return getColor(by: "Green")
    }
    
    static var gray: UIColor {
        return getColor(by: "Gray")
    }
    
    static var blue: UIColor {
        return getColor(by: "Blue")
    }
    
    static var lightGray: UIColor {
        return getColor(by: "LightGray")
    }
    
    private class func getColor(by name: String) -> UIColor {
        guard let color = UIColor(named: name) else {
            assertionFailure(String.Error.color)
            return findСlosestСolor(nameColor: name)
        }
        return color
    }
    
    private class func findСlosestСolor(nameColor: String) -> UIColor {
        var closestColor: UIColor = .gray
        if nameColor == "Green" {
            closestColor = .green
        }
        if nameColor == "Gray" {
            closestColor = .gray
        }
        if nameColor == "Blue" {
            closestColor = .blue
        }
        if nameColor == "LightGray" {
            closestColor = .gray
        }
        return closestColor
    }
}
