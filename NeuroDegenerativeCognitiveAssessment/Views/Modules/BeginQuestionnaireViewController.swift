//
//  BeginQuestionnaireViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 27.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class BeginQuestionnaireViewController: UIViewController {
    let subsidiaryVC = "SubsidiaryViewController"
    
    @IBAction func openNextScreen(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Quiz", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: subsidiaryVC)
        navigationController?.show(vc, sender: nil)
    }
}
