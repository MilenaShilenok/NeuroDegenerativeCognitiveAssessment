//
//  HomeViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 02.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewInput {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var questionnaireButton: DefaultButton!
    @IBOutlet weak var statusView: UIView!
    
    var output: HomeViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = HomePresenter(view: self) 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.turnTimer()
        setupInitialState()
    }
    
    private func setupInitialState() {
        statusView.layer.borderWidth = 5
        statusView.layer.cornerRadius = 20
        determineStatus()
    }
    
    private func determineStatus() {
        let status = output.getStatus()
        statusLabel.text = status.name
        statusView.layer.borderColor = status.color
    }
    
    func setButton(_ state: CurrentButtonState) {
        questionnaireButton.isEnabled = state.isEnabled
        questionnaireButton.setTitle(state.title, for: .normal)
    }

    @IBAction func goToNextViewController(_ sender: Any) {
        let nameVC = output.getNextViewControllerName()
        let storyboard = UIStoryboard(name: "Quiz", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: nameVC)
        navigationController?.show(vc, sender: nil)
    }
}
