//
//  HistorySessionCell.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 18.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class HistorySessionCell: UITableViewCell {
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpInitialState()
    }
    
    private func setUpInitialState() {
        borderView.layer.borderWidth = 2
        borderView.layer.borderColor = UIColor.gray.cgColor
        borderView.layer.cornerRadius = 15
        selectionStyle = .none
    }
    
    func fill(partName: String, averageScore: Int) {
        partLabel.text = partName
        pointsLabel.text = averageScore.description
    }
}
