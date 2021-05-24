//
//  CircleWithValueView.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 19.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

class CircleWithValueView: UIView {
    private(set) var label: UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initLabel()
    }
    
    override func prepareForInterfaceBuilder() {
        backgroundColor = .black
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawCircle()
    }
    
    func initLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.font = label.font.withSize(40)
    }
}
