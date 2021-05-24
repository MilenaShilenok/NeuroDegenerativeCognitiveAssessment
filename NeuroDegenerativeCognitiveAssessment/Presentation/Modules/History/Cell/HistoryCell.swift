//
//  HistoryCell.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 22.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var averageScoreLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpInitialState()
    }
    
    func fill(_ passedTest: Quiz) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        let date = passedTest.completionDate ?? Date()
        dateLabel.text = dateFormatter.string(from: date)
        averageScoreLabel.text = passedTest.averageScore.description
    }
    
    private func setUpInitialState() {
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = UIColor.gray.cgColor
        borderView.layer.cornerRadius = 18
        selectionStyle = .none
    }
    
}
