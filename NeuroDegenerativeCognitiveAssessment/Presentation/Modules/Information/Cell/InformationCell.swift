//
//  InformationCell.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 18.04.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class InformationCell: UITableViewCell {
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    private var state: CellState = .notDeployed
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpInitialState()
    }
    
    func fill(_ information: Information) {
        questionLabel.text = information.question
        answerLabel.text = information.answer
    }
    
    func toggle(completionHandler: ()->Void) {
        if state == .deployed {
            answerLabel.numberOfLines = 2
            state = .notDeployed
        } else {
            answerLabel.numberOfLines = 0
            state = .deployed
        }
        animateArrow()
        completionHandler()
    }
    
    private func setUpInitialState() {
        selectionStyle = .none
    }
  
    private func animateArrow() {
        UIView.animate(withDuration: 0.2, animations: {
            if self.state == .deployed {
                self.arrowImageView.transform = CGAffineTransform(rotationAngle: .pi)
            } else {
                self.arrowImageView.transform = CGAffineTransform(rotationAngle: 0)
            }
        })
    }
}

extension InformationCell {
    enum CellState {
        case deployed
        case notDeployed
    }
}
