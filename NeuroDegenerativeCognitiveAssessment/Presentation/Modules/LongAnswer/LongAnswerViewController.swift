//
//  LongAnswerViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 02.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

class LongAnswerViewController: UIViewController, LongAnswerViewInput {
    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonStackView: ButtonStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var output: LongAnswerViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = LongAnswerPresenter(view: self)
        setupInitialState()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let answer = answerTextView.text ?? ""
        output.saveLastAnswer(answer)
    }
    
    func setupInitialState() {
        addTapGestureRecognizer()
        answerTextView.setUpInitialState()
        setupButtonBar()
        activityIndicator.isHidden = true
        questionLabel.text = output.getQuestion()
        answerTextView.text = output.getLastAnswer()
    }
    
    @IBAction func next(_ sender: Any) {
        output.gaveAnswer(answer: answerTextView.text)
    }
    
    func setupButtonBar() {
        buttonStackView.buttonsCount = 1
        try? buttonStackView.changeButtonState(index: 0, to: .selected)
    }
    
    func startLoading() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    func openNextViewController() {
        let storyboard = UIStoryboard(name: "Quiz", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "FinishQuizViewController")
        navigationController?.show(vc, sender: nil)
    }
}
