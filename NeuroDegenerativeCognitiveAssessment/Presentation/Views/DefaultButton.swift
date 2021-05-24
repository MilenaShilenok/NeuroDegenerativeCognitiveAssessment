//
//  File.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 14.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

@IBDesignable class DefaultButton: UIButton {
    
    @IBInspectable var disabledColor: UIColor = .gray
    @IBInspectable var enabledColor: UIColor = .green
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        setTitleColor(UIColor.white, for: .normal)
        
        setBackgroundColor(color: disabledColor, forState: .disabled)
        setBackgroundColor(color: enabledColor, forState: .normal)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.cornerRadius = 15
    }
}

