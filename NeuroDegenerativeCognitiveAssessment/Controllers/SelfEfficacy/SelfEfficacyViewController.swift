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
    
    var output: SelfEfficacyViewOutput!
    var numberQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output = SelfEfficacyPresenter(view: self)
        displayQuestion(number: numberQuestion)
    }
    
    func displayQuestion(number: Int) {
        let question = output.getQuestion(number: number)
        questionLabel.text = question.question
    }
    
    func save(number: Int) {
        let answer = Int(slider.value)
        output.save(number: number, answer: answer)
    }
    
    func installSlider() {
        slider.value = Float(Int.defaultSlider)
    }
    
    @IBAction func goToNextQuestion(_ sender: Any) {
        numberQuestion += 1
        
        if numberQuestion < Int.questionsCount {
            save(number: numberQuestion - 1)
            installSlider()
            displayQuestion(number: numberQuestion)
        }
    }
    
    @IBAction func displaySelectedElement(_ sender: Any) {
        print(slider.value)
       // print(roundf(slider.value))
        let element = Int(roundf(slider.value))
        for i in 0..<numberLabels.count {
            if element == i {
                numberLabels[i].font = numberLabels[i].font.withSize(20)
               // numberLabels[i].appearance().defaultFont = UIFont.systemFont(ofSize: 25)
            }
        }
    }
    
    
    
}
