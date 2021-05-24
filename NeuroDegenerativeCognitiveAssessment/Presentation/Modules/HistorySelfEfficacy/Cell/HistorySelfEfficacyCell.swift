//
//  HistorySelfEfficacyCell.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 21.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class HistorySelfEfficacyCell: UITableViewCell {
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func fill(_ answer: AnswerPartOne) {
        questionLabel.text = answer.question
        answerLabel.text = String.History.yourAnswer + answer.answer.description
    }
}
