//
//  FinishQuizViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 09.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

// TODO: Create own CircleProgressView
class FinishQuizViewController: UIViewController, FinishQuizViewInput {
    @IBOutlet var circleViews: [UIView]!
    @IBOutlet weak var averageScoreView: UIView!
    
    var output: FinishQuizViewOutput!
    private let historyService: HistoryService = HistoryServiceImp.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = FinishQuizPresenter(view: self)
        hideBars()
       // display()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        averageScoreView.drawCircleWith(value: 100)
        circleViews.forEach { (view) in
            view.drawCircleWith(value: 100)
        }
    }
    
    func hideBars() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func goToHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
   /* func display() {
        drawСircle(view: averageScoreView)
        circleViews.forEach { (view) in
            drawСircle(view: view)
        }
        
        do {
            try displayAverageScore()
        } catch {
            averagePointsLabel.text = "0"
            pointsLabels.forEach { (label) in
                label.text = "0"
            }
        }
    }*/
    
    /*func drawСircle(view: UIView) {
        let cornerRadius = view.bounds.size.height / 2
        view.layer.cornerRadius = cornerRadius
        view.clipsToBounds = true
        view.layer.borderWidth = 7
        view.layer.borderColor = UIColor.blue.cgColor
    }*/
    
    /*func displayAverageScore() throws {
        let passedTest = historyService.passedTests.last
        guard let averageScorePartOne = passedTest?.partOne?.averageScore, let averageScorePartTwo = passedTest?.partTwo?.averageScore, let averageScorePartThree = passedTest?.partThree?.averageScore else {
            throw SystemError.averageScoreNotFond
        }
        
        averagePointsLabel.text = passedTest?.averageScore.description
        pointsLabels.forEach { (label) in
            if label.tag == 1 {
                label.text = averageScorePartOne.description
            } else if label.tag == 2 {
                label.text = averageScorePartTwo.description
            } else {
                label.text = averageScorePartThree.description
            }
        }
    }*/
}
