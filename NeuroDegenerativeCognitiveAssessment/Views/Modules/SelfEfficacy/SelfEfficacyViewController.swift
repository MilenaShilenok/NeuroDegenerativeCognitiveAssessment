//
//  SelfEfficacyViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 21.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class SelfEfficacyViewController: UIViewController, SelfEfficacyViewInput {
    
    @IBOutlet var numberLabels: [UILabel]!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var stackView: UIStackView!
    
    var output: SelfEfficacyViewOutput!
    let enlargedFont = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = SelfEfficacyPresenter(view: self)
        openNextQuestion()
        navigationController?.setNavigationBarHidden(true, animated: true)
        progressView.progress = 0
        resetSlider()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        makeButtonBar()
    }
    
    func openNextQuestion() {
        let question = output.getQuestion()
        questionLabel.text = question
    }
    
    func save() {
        let answer = Int(slider.value)
        output.save(answer: answer)
    }
    
    func resetSlider() {
        let defaultSliderValue = 5
        slider.value = Float(defaultSliderValue)
        droppingLabels()
        numberLabels[defaultSliderValue].font = numberLabels[defaultSliderValue].font.withSize(CGFloat(enlargedFont))
    }
    
    func makeButtonBar() {
        for i in 1...output.questionsCount {
            let button = ButtonForQuiz(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            button.backgroundColor = UIColor.blue
            button.setTitle(i.description, for: .normal)
            stackView.addArrangedSubview(button)
        }
    }
    
    func setProgress() {
        let progress = output.getCurrentProgress()
        progressView.setProgress(progress, animated: true)
    }
    
    func droppingLabels() {
        let standardFont = 17
        numberLabels.forEach { (label) in
            label.font = label.font.withSize(CGFloat(standardFont))
        }
    }
    
    @IBAction func goToNextQuestion(_ sender: Any) {
        save()
        resetSlider()
        setProgress()
        openNextQuestion()
       
    }
    
    @IBAction func displaySelectedElement(_ sender: Any) {
        droppingLabels()
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
