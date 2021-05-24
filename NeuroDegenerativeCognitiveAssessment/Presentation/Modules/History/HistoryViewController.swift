//
//  HistoryViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 22.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, HistoryViewInput {
    @IBOutlet weak var noHistoryLabel: UILabel!
    @IBOutlet weak var historyTableView: UITableView!
    
    var output: HistoryViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = HistoryPresenter(view: self)
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayTableView()
        historyTableView.reloadData()
    }
    
    private func displayTableView() {
        if output.fetchPassedTests().isEmpty {
            noHistoryLabel.text = String.History.noHistory
            historyTableView.isHidden = true
            noHistoryLabel.isHidden = false
        } else {
            historyTableView.isHidden = false
            noHistoryLabel.isHidden = true
        }
    }
    
    private func setUpTableView() {
        historyTableView.dataSource = self
        historyTableView.delegate = self
        
        let nib = UINib(nibName: HistoryHeaderView.identifier, bundle: nil)
        historyTableView.register(nib, forHeaderFooterViewReuseIdentifier: HistoryHeaderView.identifier)
        historyTableView.estimatedSectionHeaderHeight = 200
        historyTableView.sectionHeaderHeight = UITableView.automaticDimension
        
        historyTableView.rowHeight = 85
        historyTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        historyTableView.register(HistoryCell.nib, forCellReuseIdentifier: HistoryCell.identifier)
    }
    
    private func nextViewController() {
        let storyboard = UIStoryboard(name: "History", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HistorySessionViewController")
        prepare(destinationVC: vc)
        navigationController?.show(vc, sender: nil)
    }
    
    private func prepare(destinationVC: UIViewController) {
        if let vc = destinationVC as? HistorySessionViewController,
           let selectedRow = historyTableView.indexPathForSelectedRow?.row {
            vc.passedTest = output.fetchPassedTests()[selectedRow]
        }
    }
}

extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.fetchPassedTests().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.identifier) as! HistoryCell
        let passedTest = output.fetchPassedTests()[indexPath.row]
        cell.fill(passedTest)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nextViewController()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HistoryHeaderView.identifier) as? HistoryHeaderView else {
            return nil
        }
        header.buildGraph(points: output.getPassedTestsPoints())
        return header
    }
}
