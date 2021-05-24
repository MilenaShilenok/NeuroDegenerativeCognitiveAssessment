//
//  DateFormatter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 05.05.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import Foundation

extension DateFormatter {
    func getDateFormat(_ dateFormat: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter
    }
}
