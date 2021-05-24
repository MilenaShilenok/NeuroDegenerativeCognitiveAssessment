//
//  HeaderShort .swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 25.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class HeaderShortAnswerView: UITableViewHeaderFooterView {
    @IBOutlet weak var averageScoreView: CircleWithValueView!
    @IBOutlet weak var dateLabel: UILabel!
    
    static let identifier = "HeaderShortAnswerView"
    
    func fill(date: Date, points: Int) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateLabel.text = dateFormatter.string(from: date)
        averageScoreView.label.text = points.description
    }
}
