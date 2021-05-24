//
//  HistorySessionViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 18.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class HistorySessionViewController: UIViewController, HistorySessionViewInput {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var averageScoreView: CircleWithValueView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    
    var output: HistorySessionViewOutput!
    var passedTest: Quiz!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = HistorySessionPresenter(view: self)
        checkPassedTest()
    }
    
    private func checkPassedTest() {
        if let passedTest = passedTest {
            configure(passedTest)
        } else {
            showError()
        }
    }
    
    private func configure(_ passedTest: Quiz) {
        setupTableView()
        fill(passedTest)
    }
    
    private func showError() {
        tableView.isHidden = true
        contentView.isHidden = true
        show(error: SystemError.historyUnavailable) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func setupTableView() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(HistorySessionCell.nib, forCellReuseIdentifier: HistorySessionCell.identifier)
    }
    
    private func fill(_ passedTest: Quiz) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let date = passedTest.completionDate ?? Date() 
        dateLabel.text = dateFormatter.string(from: date)
        averageScoreView.label.text = passedTest.averageScore.description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selfEfficacyVC = segue.destination as? HistorySelfEfficacyViewController {
            selfEfficacyVC.passedTest = passedTest
        } else if let shortAnswerVC = segue.destination as? HistoryShortAnswerViewController {
            shortAnswerVC.passedTest = passedTest
        } else if let longAnswerVC = segue.destination as? HistoryLongAnswerViewController {
            longAnswerVC.passedTest = passedTest
        }
    }
}

extension HistorySessionViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let partsCount = 3
        return partsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistorySessionCell.identifier) as! HistorySessionCell
        var partName = ""
        var averageScore = 0
        if indexPath.row == 0 {
            partName = String.PartsName.partOne
            averageScore = passedTest.partOne?.averageScore ?? 0
        } else if indexPath.row == 1 {
            partName = String.PartsName.partTwo
            averageScore = passedTest.partTwo?.averageScore ?? 0
        } else {
            partName = String.PartsName.partThree
            averageScore = passedTest.partThree?.averageScore ?? 0
        }
        cell.fill(partName: partName, averageScore: averageScore)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "HistorySelfEfficacyViewController", sender: .none)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "HistoryShortAnswerViewController", sender: .none)
        } else {
            performSegue(withIdentifier: "HistoryLongAnswerViewController", sender: .none)
        }
    }
}
