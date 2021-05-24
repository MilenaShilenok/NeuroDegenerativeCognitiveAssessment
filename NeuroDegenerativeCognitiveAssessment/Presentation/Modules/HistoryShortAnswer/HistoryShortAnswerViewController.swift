//
//  HistoryShortAnswerViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 16.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit
import SwiftUI

class HistoryShortAnswerViewController: UIViewController, HistoryShortAnswerViewInput {
    @IBOutlet weak var shortAnswerTableView: UITableView!
    
    var output: HistoryShortAnswerViewOutput!
    var passedTest: Quiz!

    override func viewDidLoad() {
        super.viewDidLoad()
        checkAvailabilityPassedTest()
        output = HistoryShortAnswerPresenter(view: self)
        setupTableView()
    }
    
    private func setupTableView() {
        shortAnswerTableView.dataSource = self
        shortAnswerTableView.delegate = self
        shortAnswerTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        shortAnswerTableView.estimatedRowHeight = 100
        shortAnswerTableView.rowHeight = UITableView.automaticDimension
        shortAnswerTableView.estimatedSectionHeaderHeight = 100
        shortAnswerTableView.sectionHeaderHeight = UITableView.automaticDimension
        let nib = UINib(nibName: HeaderShortAnswerView.identifier, bundle: nil)
        shortAnswerTableView.register(nib, forHeaderFooterViewReuseIdentifier: HeaderShortAnswerView.identifier)
        
        shortAnswerTableView.register(HistoryShortAnswerTextCell.nib, forCellReuseIdentifier: HistoryShortAnswerTextCell.identifier)
        shortAnswerTableView.register(HistoryShortAnswerImageCell.nib, forCellReuseIdentifier: HistoryShortAnswerImageCell.identifier)
    }
    
    private func checkAvailabilityPassedTest() {
        if passedTest == nil {
            show(error: SystemError.historyUnavailable) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}

extension HistoryShortAnswerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passedTest.partTwo?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let answer = passedTest.partTwo?.answers[indexPath.row] else {
            return UITableViewCell()
        }
        
        if answer.option.type == .text {
            let cell = tableView.dequeueReusableCell(withIdentifier: HistoryShortAnswerTextCell.identifier) as! HistoryShortAnswerTextCell
            cell.fill(with: answer)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: HistoryShortAnswerImageCell.identifier) as! HistoryShortAnswerImageCell
            cell.fill(with: answer)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let date = passedTest.completionDate,
           let averageScore = passedTest.partTwo?.averageScore,
           let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderShortAnswerView.identifier) as? HeaderShortAnswerView else {
            return nil
        }
        
        header.fill(date: date, points: averageScore)
        return header
    }
}
