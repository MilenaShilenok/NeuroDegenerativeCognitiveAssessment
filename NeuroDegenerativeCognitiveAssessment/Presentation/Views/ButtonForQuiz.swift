//
//  DefaultButtonForTest.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 21.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

class ButtonForQuiz: UIButton {
    var stateButton: ButtonForQuiz.State = .notPassed {
        didSet {
            updateState()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialState()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupInitialState()
    }
    
    private func setupInitialState() {
        layer.cornerRadius = 5
        clipsToBounds = true
        
        layer.borderWidth = 2.5
        backgroundColor = .white
        layer.borderColor = UIColor.black.cgColor
        setTitleColor(UIColor.black, for: .normal)
    }
    
    private func updateState() {
        switch stateButton {
        case .notPassed:
            backgroundColor = .white
            layer.borderColor = UIColor.black.cgColor
        case .passed:
            backgroundColor = UIColor.green
            layer.borderColor = UIColor.black.cgColor
        case .selected:
            layer.borderColor = UIColor.blue.cgColor
        }
    }
}

extension ButtonForQuiz {
    enum State {
        case passed
        case selected 
        case notPassed
    }
}
