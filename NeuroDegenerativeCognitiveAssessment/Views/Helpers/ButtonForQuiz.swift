//
//  DefaultButtonForTest.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 21.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class ButtonForQuiz: UIButton {
    var stateButton: ButtonForQuiz.State = .notPassed {
        didSet {
            updateState()
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
   /* let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = .fill // .leading .firstBaseline .center .trailing .lastBaseline
    stackView.distribution = .fill // .fillEqually .fillProportionally .equalSpacing .equalCentering*/

    
    private func setupInitialState() {
      //  let button = UIButton(frame: CGRect(x: 20, y: 100, width: 20, height: 20))
       // let button2 = UIButton(frame: CGRect()
        layer.cornerRadius = 5
        clipsToBounds = true
        
        layer.borderWidth = 2.5
        layer.borderColor = UIColor.black.cgColor
        setTitleColor(UIColor.black, for: .normal)
    }
    
    private func updateState() {
        switch stateButton {
        case .notPassed:
            backgroundColor = .white
        case .passed:
            backgroundColor = UIColor.green
            layer.borderColor = UIColor.black.cgColor
        case .current:
            layer.borderColor = UIColor.blue.cgColor
        }
    }
    
   /* var state: SelectableImageView.State = .undefined {
        didSet {
            updateState()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dimmingView.frame = bounds
    }
    
    private func updateState() {
        switch state {
        case .selected:
            layer.borderWidth = 5
            dimmingView.alpha = 0
        case .undefined:
            layer.borderWidth = 0
            dimmingView.alpha = 0
        case .notSelected:
            layer.borderWidth = 0
            dimmingView.alpha = 0.5
        }
    }
     extension SelectableImageView {
         enum State {
             case undefined
             case selected
             case notSelected
         }*/
}

extension ButtonForQuiz {
    enum State {
        case passed
        case current
        case notPassed
    }
}

/*override func viewDidLoad() {
    super.viewDidLoad()

    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    button.backgroundColor = .green
    button.setTitle("Test Button", for: .normal)
    button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

    self.view.addSubview(button)
}

@objc func buttonAction(sender: UIButton!) {
  print("Button tapped")
}*/


