//
//  LongAnswerViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 02.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class LongAnswerViewController: UIViewController, LongAnswerViewInput {
    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var stackViewForButtonBar: UIStackView!
    
    var output: LongAnswerViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = LongAnswerPresenter(view: self)
        setupInitialState()
    }
    
    func setupInitialState() {
        answerTextView.layer.borderWidth = 1
        answerTextView.layer.cornerRadius = 10
        answerTextView.layer.borderColor = UIColor.gray.cgColor
        
        questionLabel.text = output.getQuestion()
    }
    
    @IBAction func next(_ sender: Any) {
        do {
            try output.validate(answer: answerTextView.text)
            output.save(answer: answerTextView.text)
            openNextViewController()
        } catch {
            show(error: error, handler: nil)
        }
    }
    
    func openNextViewController() {
        let storyboard = UIStoryboard(name: "Quiz", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FinishQuizViewController")
        navigationController?.show(vc, sender: nil)
    }
    
    func makeButtonBar() {
      //  for i in 1..<9 {
            let button = ButtonForQuiz(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            button.backgroundColor = UIColor.blue
            stackViewForButtonBar.addArrangedSubview(button)
       // }
    }
}
