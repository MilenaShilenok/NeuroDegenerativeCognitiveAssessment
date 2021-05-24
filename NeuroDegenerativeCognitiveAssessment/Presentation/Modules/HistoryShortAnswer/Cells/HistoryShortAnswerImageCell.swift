//
//  HistoryShortAnswerCell.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 16.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class HistoryShortAnswerImageCell: UITableViewCell {
    @IBOutlet weak var answerImageView: UIImageView!
    @IBOutlet weak var responseTimeLabel: UILabel!
    @IBOutlet weak var isCorrectLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var isCorrectImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        answerImageView.layer.borderWidth = 6
        selectionStyle = .none
    }
    
    func fill(with answer: AnswerPartTwo) {
        var color = UIColor.red
        var correctImage = UIImage(named: "redCross")
        if answer.option.isCorrect {
            color = UIColor.green
            correctImage = UIImage(named: "greenCheckMark")
        }
        
        let answerImage = UIImage(named: answer.option.value)
        answerImageView.image = answerImage
        answerImageView.layer.borderColor = color.cgColor
        questionLabel.text = answer.question
        isCorrectLabel.text = answer.isCorrect ? String.History.correct : String.History.incorrect
        responseTimeLabel.text = String.History.responsesTime + answer.time.description + String.History.sec
        isCorrectImageView.image = correctImage
    }
}
