//
//  HistorySelfEfficacyViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 18.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class HistorySelfEfficacyViewController: UIViewController, HistorySelfEfficacyViewInput {
    @IBOutlet weak var selfEfficacyTableView: UITableView!
    
    var output: HistorySelfEfficacyViewOutput!
    var passedTest: Quiz!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkAvailabilityPassedTest()
        output = HistorySelfEfficacyPresenter(view: self)
        setupTableView()
    }
    
    private func checkAvailabilityPassedTest() {
        if passedTest == nil {
            show(error: SystemError.historyUnavailable) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    private func setupTableView() {
        selfEfficacyTableView.register(HistorySelfEfficacyCell.nib, forCellReuseIdentifier: HistorySelfEfficacyCell.identifier)
        selfEfficacyTableView.dataSource = self
        selfEfficacyTableView.delegate = self
        selfEfficacyTableView.rowHeight = 135
        selfEfficacyTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        selfEfficacyTableView.estimatedSectionHeaderHeight = 100
        selfEfficacyTableView.sectionHeaderHeight = UITableView.automaticDimension
        let nib = UINib(nibName: HeaderSelfEfficacyView.identifier, bundle: nil)
        selfEfficacyTableView.register(nib, forHeaderFooterViewReuseIdentifier: HeaderSelfEfficacyView.identifier)
    }
    
}

extension HistorySelfEfficacyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passedTest.partOne?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistorySelfEfficacyCell.identifier) as! HistorySelfEfficacyCell
        if let answers = passedTest.partOne?.answers {
            cell.fill(answers[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let date = passedTest.completionDate,
           let averageScore = passedTest.partOne?.averageScore,
           let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderSelfEfficacyView.identifier) as? HeaderSelfEfficacyView else {
            return nil
        }
        header.fill(date: date, points: averageScore)
        return header
    }
}
