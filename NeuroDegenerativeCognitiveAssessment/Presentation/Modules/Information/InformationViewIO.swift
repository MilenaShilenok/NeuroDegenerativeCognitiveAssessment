//
//  InformationViewIO.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 18.04.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import Foundation

protocol InformationViewInput: class {
    
}

protocol InformationViewOutput {
    var information: [Information] { get }
}
