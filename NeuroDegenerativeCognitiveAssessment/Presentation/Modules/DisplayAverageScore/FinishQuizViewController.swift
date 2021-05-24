//
//  FinishQuizViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 09.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

class FinishQuizViewController: UIViewController, FinishQuizViewInput {
    @IBOutlet weak var averageScoreView: CircleWithValueView!
    @IBOutlet weak var partOnePointsView: CircleWithValueView!
    @IBOutlet weak var partTwoPointsView: CircleWithValueView!
    @IBOutlet weak var partThreePointsView: CircleWithValueView!
    @IBOutlet weak var goToHomeButton: DefaultButton!
    
    var output: FinishQuizViewOutput!
    var averageScorePartOne = 0
    var averageScorePartTwo = 0
    var averageScorePartThree = 0
    var totalAverageScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        output = FinishQuizPresenter(view: self)
        hideBars()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getAverageScore()
        displayPoints()
    }
    
    func hideBars() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func displayPoints() {
        averageScoreView.label.text = totalAverageScore.description
        partOnePointsView.label.text = averageScorePartOne.description
        partTwoPointsView.label.text = averageScorePartTwo.description
        partThreePointsView.label.text = averageScorePartThree.description
    }
    
    func getAverageScore() {
        let passedTest = try? output.getPassedTest()
        averageScorePartOne = passedTest?.partOne?.averageScore ?? 0
        averageScorePartTwo = passedTest?.partTwo?.averageScore ?? 0
        averageScorePartThree = passedTest?.partThree?.averageScore ?? 0
        totalAverageScore = passedTest?.averageScore ?? 0
    }
    
    @IBAction func goToHome(_ sender: Any) {
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.popToRootViewController(animated: true)
    }
}
