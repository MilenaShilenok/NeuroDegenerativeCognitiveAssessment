//
//  SubsidiaryViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 25.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

class SubsidiaryViewController: UIViewController, SubsidiaryViewInput {
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    
    var output: SubsidiaryViewOutput!
    
    private let selfEfficacyVC = "SelfEfficacyViewController"
    private let shortAnswerVC = "ShortAnswerViewController"
    private let longAnswerVC = "LongAnswerViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = SubsidiaryPresenter(view: self)
        displayCurrentPart()
    }
    
    func displayCurrentPart() {
        if output.currentStage == .partOne {
            display(part: String.PartsName.partOne, instruction: String.InstructionForQuiz.instructionPartOne)
        }
        if output.currentStage == .partTwo {
            display(part: String.PartsName.partTwo, instruction: String.InstructionForQuiz.instructionPartTwo)
        }
        if output.currentStage == .partThree {
            display(part: String.PartsName.partThree, instruction: String.InstructionForQuiz.instructionPartThree)
        }
    }
    
    func display(part: String, instruction: String) {
        partLabel.text = part
        instructionLabel.text = instruction
    }
    
    @IBAction func nextPart(_ sender: Any) {
        let stage = output.currentStage
        
        switch stage {
        case .partOne:
            startNextPart(nameViewController: selfEfficacyVC)
        case .partTwo:
            startNextPart(nameViewController: shortAnswerVC)
        case .partThree:
            startNextPart(nameViewController: longAnswerVC)
        }
    }
    
    func startNextPart(nameViewController: String) {
        let storyboard = UIStoryboard(name: "Quiz", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: nameViewController)
        navigationController?.show(vc, sender: nil)
    }
}
