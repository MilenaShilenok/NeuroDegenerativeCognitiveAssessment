//
//  HeaderView.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 23.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class HeaderSelfEfficacyView: UITableViewHeaderFooterView {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var averageScoreView: CircleWithValueView!
    
    static let identifier = "HeaderSelfEfficacyView"
    
    func fill(date: Date, points: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateLabel.text = dateFormatter.string(from: date)
        averageScoreView.label.text = points.description
    }
}
