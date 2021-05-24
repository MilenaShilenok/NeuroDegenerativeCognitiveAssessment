//
//  ExportResultsViewIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 03.04.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import Foundation

protocol ExportResultsViewInput: class, UIViewInput {

}

protocol ExportResultsViewOutput {
    var hasPassedTests: Bool { get }
    
    func getFileUrl() throws -> URL
}
