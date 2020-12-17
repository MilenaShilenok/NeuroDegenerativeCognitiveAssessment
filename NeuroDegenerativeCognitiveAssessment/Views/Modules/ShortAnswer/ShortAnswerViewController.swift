//
//  ShortAnswerViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 04.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class ShortAnswerViewController: UIViewController, ShortAnswerViewInput, SelectableImageViewDelegate {
    
    @IBOutlet weak var imageAnswersContainerView: UIView!
    @IBOutlet weak var textAnswersContainerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answersImageViews: [SelectableImageView]!
    @IBOutlet var textAnswersButtons: [SelectableButton]!
    @IBOutlet weak var nextQuestionButton: DefaultButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var stackView: UIStackView!
    
    var output: ShortAnswerViewOutput!
    private var selectedOption: Option? {
        didSet {
            setupNextButtonState()
        }
    }
    
    // MARK: life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        output = ShortAnswerPresenter(view: self)
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        makeButtonBar()
    }
    
    func setupInitialState() {
        answersImageViews.forEach { (view) in
            view.delegate = self
        }
        resetButtonsState()
        setupNextButtonState()
    }
    
    func setupNextButtonState() {
        nextQuestionButton.isEnabled = selectedOption != nil
    }
    
    func resetButtonsState() {
        answersImageViews.forEach { (view) in
            view.state = .undefined
        }
        textAnswersButtons.forEach { (button) in
            button.isSelected = false
        }
    }
  
    // MARK: display question
    func display(_ question: QuestionPartTwo) {
        if question.type == .image {
            displayImageQuestion(question)
        } else {
            displayTextQuestion(question)
        }
    }
    
    func makeButtonBar() {
        for i in 1...output.questions.count {
            let button = ButtonForQuiz(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            button.backgroundColor = UIColor.blue
            button.setTitle(i.description, for: .normal)
            stackView.addArrangedSubview(button)
        }
    }
    
    func displayImageQuestion(_ question: QuestionPartTwo) {
        textAnswersContainerView.isHidden = true
        imageAnswersContainerView.isHidden = false
        questionLabel.text = question.question
        
        for i in 0..<question.answers.count {
            answersImageViews[i].set(option: question.answers[i])
        }
    }
 
    func displayTextQuestion(_ question: QuestionPartTwo) {
        textAnswersContainerView.isHidden = false
        imageAnswersContainerView.isHidden = true
        questionLabel.text = question.question
        
        for i in 0..<question.answers.count {
            textAnswersButtons[i].setTitleText(option: question.answers[i])
        }
    }
    
    // MARK: answer question
    @IBAction func didSelectTextAnswer(_ sender: SelectableButton) {
        textAnswersButtons.forEach { (button) in
            button.isSelected = false
        }
        sender.isSelected = true
        selectedOption = sender.option
    }
    
    func didSelect(selectableImageView: SelectableImageView) {
        answersImageViews.forEach { (image) in
            image.state = .notSelected
        }
        selectableImageView.state = .selected
        selectedOption = selectableImageView.option
    }
    
    func setProgress() {
        let progress = output.getCurrentProgress()
        progressView.setProgress(progress, animated: true)
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        if let option = selectedOption {
            setProgress()
            output.didSelect(option)
            selectedOption = nil
        } else {
            // error
        }
        
        resetButtonsState()
    }
    
    func openNextViewController() {
        let storyboard = UIStoryboard(name: "Quiz", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SubsidiaryViewController")
        navigationController?.show(vc, sender: nil)
        
//        navigationController?.popToRootViewController(animated: <#T##Bool#>)
//    unwind segue
    }

}
