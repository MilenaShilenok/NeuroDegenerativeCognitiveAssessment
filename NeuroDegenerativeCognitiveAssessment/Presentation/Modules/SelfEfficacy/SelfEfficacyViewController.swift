//
//  SelfEfficacyViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 21.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit
//TODO: дата на графике

class SelfEfficacyViewController: UIViewController, SelfEfficacyViewInput, ButtonStackViewDelegate {
    @IBOutlet var numberLabels: [UILabel]!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var stackView: ButtonStackView!
    
    var output: SelfEfficacyViewOutput!
    let enlargedFont: CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = SelfEfficacyPresenter(view: self)
        output.viewIsReady()
    }
    
    func setupInitialState() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        resetSlider()
        setupButtonBar()
        openQuestion(index: 0)
    }
    
    private func setupButtonBar() {
        stackView.delegate = self
        stackView.buttonsCount = output.questionsCount
    }
    
    private func resetSlider(defaultSliderValue: Int = 5) {
        slider.value = Float(defaultSliderValue)
        resetLabels()
        let font = numberLabels[defaultSliderValue].font.withSize(enlargedFont)
        numberLabels[defaultSliderValue].font = font
    }
   
    private func resetLabels() {
        let standardFont: CGFloat = 17
        numberLabels.forEach { (label) in
            label.font = label.font.withSize(standardFont)
        }
    }
    
    private func setProgress() {
        let progress = output.getCurrentProgress()
        progressView.setProgress(progress, animated: true)
    }
    
    func updateScreen() {
        resetSlider()
        setProgress()
        openQuestion()
    }
    
    private func openQuestion(index: Int? = nil) {
        let question = output.getQuestion(index: index)
        questionLabel.text = question.question
        resetSlider(defaultSliderValue: question.answer)
        try? stackView.changeButtonState(index: question.index, to: .selected)
    }
    
    func buttonStackView(_ buttonStackView: ButtonStackView, didSelectButtonAt index: Int) {
        openQuestion(index: index)
    }
    
    @IBAction func goToNextQuestion(_ sender: Any) {
        try? stackView.changeButtonState(index: output.currentQuestionIndex, to: .passed)
        let answer = Int(round(slider.value))
        output.didSelect(answer: answer)
    }
    
    @IBAction func displaySelectedElement(_ sender: Any) {
        resetLabels()
        let value = Int(roundf(slider.value))
        
        let label = numberLabels.first { (label) -> Bool in
            return label.tag == value
        }
        label?.font = label?.font.withSize(CGFloat(enlargedFont))
    }

    func openNextViewController() {
        let storyboard = UIStoryboard(name: "Quiz", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(identifier: "SubsidiaryViewController")
        navigationController?.show(destinationVC, sender: nil)
    }
}

