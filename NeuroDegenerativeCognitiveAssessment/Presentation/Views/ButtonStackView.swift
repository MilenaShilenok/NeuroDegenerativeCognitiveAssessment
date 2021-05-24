//
//  ButtonStackView.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 19.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

protocol ButtonStackViewDelegate: class {
    func buttonStackView(_ buttonStackView: ButtonStackView, didSelectButtonAt index: Int)
}

class ButtonStackView: UIStackView {
    weak var delegate: ButtonStackViewDelegate?
    
    var buttonsCount: Int = 0 {
        didSet {
            setButtons()
        }
    }
    
    private var buttons: [ButtonForQuiz] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpInitialState()
    }
    
    private func setButtons() {
        if buttonsCount > buttons.count {
            addButtons()
        } else {
            removeButtons()
        }
    }
    
    private func addButtons() {
        for i in buttons.count + 1...buttonsCount {
            let button = ButtonForQuiz()
            button.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
            button.tag = i
            button.setTitle(i.description, for: .normal)
            buttons.append(button)
            addArrangedSubview(button)
        }
    }
    
    private func removeButtons() {
        var index = buttons.count - 1
        while index >= buttonsCount {
            buttons[index].removeFromSuperview()
            buttons.remove(at: index)
            index -= 1
        }
    }
    
    private func setUpInitialState() {
        axis = .horizontal
        alignment = .fill
        distribution = .fillEqually
        
        buttons.first?.stateButton = .selected
    }
    
    func changeButtonState(index: Int, to state: ButtonForQuiz.State) throws {
        guard index < buttons.count else {
            throw SystemError.indexOutOfRange
        }
        if state == .selected {
            buttons.forEach { (button) in
                button.layer.borderColor = UIColor.black.cgColor
            }
        }
        buttons[index].stateButton = state
    }
    
    @objc func buttonDidTapped(_ sender: ButtonForQuiz) {
        delegate?.buttonStackView(self, didSelectButtonAt: sender.tag - 1)
    }
}
