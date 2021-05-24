//
//  HistoryShortAnswerTextCell.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 19.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class HistoryShortAnswerTextCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var textAnswerLabel: UILabel!
    @IBOutlet weak var isCorrectLabel: UILabel!
    @IBOutlet weak var responseTimeLabel: UILabel!
    @IBOutlet weak var isCorrectImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpInitialState()
    }
    
    private func setUpInitialState() {
        textAnswerLabel.layer.cornerRadius = 20
        textAnswerLabel.layer.masksToBounds = true
        selectionStyle = .none
    }
    
    func fill(with answer: AnswerPartTwo) {
        var color = UIColor.red
        var correctImage = UIImage(named: "redCross")
        if answer.option.isCorrect {
            color = UIColor.green
            correctImage = UIImage(named: "greenCheckMark")
        }
        
        textAnswerLabel.text = answer.option.value
        textAnswerLabel.backgroundColor = color
        questionLabel.text = answer.question
        let correct = String.History.correct
        let incorrect = String.History.incorrect
        isCorrectLabel.text = answer.isCorrect ? correct: incorrect
        responseTimeLabel.text = String.History.responsesTime + answer.time.description + String.History.sec
        isCorrectImageView.image = correctImage
    }
}
