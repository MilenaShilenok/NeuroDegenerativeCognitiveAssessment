//
//  HistoryLongAnswerViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 18.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class HistoryLongAnswerViewController: UIViewController, HistoryLongAnswerViewInput {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var averageScoreView: CircleWithValueView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var gunningFogLabel: UILabel!
    
    var output: HistoryLongAnswerViewOutput!
    var passedTest: Quiz!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = HistoryLongAnswerPresenter(view: self)
        do {
            try fill()
        } catch {
            showError(error) 
        }
    }
    
    private func showError(_ error: Error) {
        contentView.isHidden = true
        show(error: error) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func fill() throws {
        guard let date = passedTest.completionDate,
              let points = passedTest.partThree?.averageScore,
              let question = passedTest.partThree?.question,
              let answer = passedTest.partThree?.answer,
              let gunningFog = passedTest.partThree?.gunningFogIndex else {
            throw SystemError.historyUnavailable
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateLabel.text = dateFormatter.string(from: date)
        averageScoreView.label.text = points.description
        questionLabel.text = question
        answerLabel.text = answer
        gunningFogLabel.text = String.History.gunningFog + gunningFog.description
    }
}
