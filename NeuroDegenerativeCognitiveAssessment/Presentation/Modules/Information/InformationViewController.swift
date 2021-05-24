//
//  InformationViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 18.04.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController, InformationViewInput {
    @IBOutlet weak var informationTableView: UITableView!
    
    var output: InformationViewOutput!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        output = InformationPresenter(view: self)
        setupTableView()
    }
    
    private func setupTableView() {
        informationTableView.estimatedRowHeight = 100
        informationTableView.rowHeight = UITableView.automaticDimension
        informationTableView.register(InformationCell.nib, forCellReuseIdentifier: InformationCell.identifier)
        informationTableView.dataSource = self
        informationTableView.delegate = self
        informationTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
}
 
extension InformationViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InformationCell.identifier) as! InformationCell
        let information = output.information[indexPath.row]
        cell.fill(information)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? InformationCell {
            cell.toggle {
                informationTableView.beginUpdates()
                informationTableView.endUpdates()
            }
        }
    }
}
