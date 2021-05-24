//
//  SelectableButton.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 13.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

class SelectableButton: UIButton {
    var option: Option?
    
    override var isSelected: Bool {
        didSet {
            updateState()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateState()
        layer.cornerRadius = 15
        tintColor = .clear
    }
    
    private func updateState() {
        backgroundColor = isSelected ? .green : .gray
        let color: UIColor = isSelected ? .white : .black
        setTitleColor(color, for: .normal)
    }
    
    func setTitleText(option: Option) {
        self.option = option
        setTitle(option.value, for: .normal)
    }
}
