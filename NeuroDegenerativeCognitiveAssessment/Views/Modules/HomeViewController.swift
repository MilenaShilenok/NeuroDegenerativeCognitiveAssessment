//
//  HomeViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 02.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var beginQuestionnaireButton: DefaultButton!
    @IBOutlet weak var statusView: UIView!
    
    let historyService: HistoryService = HistoryServiceImp.instance
    var status = String.Status.notDetermined
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = defineStatus()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        displayBars()
    }
    
    func setupInitialState() {
        statusView.layer.borderWidth = 5
        statusView.layer.cornerRadius = 20
    }
    
    func displayBars() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func defineStatus() -> String {
        if historyService.passedTests.count < 3 {
            status = String.Status.notDetermined
            statusView.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        return status 
    }
}
