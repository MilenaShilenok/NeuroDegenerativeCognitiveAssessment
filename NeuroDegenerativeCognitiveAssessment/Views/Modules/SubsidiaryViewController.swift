//
//  SubsidiaryViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 25.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class SubsidiaryViewController: UIViewController {
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    
    let historyService: HistoryService = HistoryServiceImp.instance
    
    private let selfEfficacyVC = "SelfEfficacyViewController"
    private let shortAnswerVC = "ShortAnswerViewController"
    private let longAnswerVC = "LongAnswerViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCurrentPart()
    }
    
    func displayCurrentPart() {
        if historyService.currentTest.stage == .partOne {
            display(part: String.InstructionForQuiz.partOne, instruction: String.InstructionForQuiz.instructionPartOne)
        }
        if historyService.currentTest.stage == .partTwo {
            display(part: String.InstructionForQuiz.partTwo, instruction: String.InstructionForQuiz.instructionPartTwo)
        }
        if historyService.currentTest.stage == .partThree {
            display(part: String.InstructionForQuiz.partThree, instruction: String.InstructionForQuiz.instructionPartThree)
        }
    }
    
    func display(part: String, instruction: String) {
        partLabel.text = part
        instructionLabel.text = instruction
    }
    
    @IBAction func nextPart(_ sender: Any) {
        startNextPart(nameViewController: "FinishQuizViewController")
       // startNextPart(nameViewController: "NoViewController")
//        TODO: switch 
       /* if historyService.currentTest.stage == .partOne {
            startNextPart(nameViewController: selfEfficacyVC)
        } else if historyService.currentTest.stage == .partTwo {
            startNextPart(nameViewController: shortAnswerVC)
        } else if historyService.currentTest.stage == .partThree {
            startNextPart(nameViewController: longAnswerVC)
        }*/
    }
    
    func startNextPart(nameViewController: String) {
        let storyboard = UIStoryboard(name: "Quiz", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: nameViewController)
        navigationController?.show(vc, sender: nil)
    }
    
}
