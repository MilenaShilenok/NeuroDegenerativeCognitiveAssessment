//
//  LongAnswerService.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 06.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import Foundation

protocol LongAnswerService {
    func getGunningFog(text: String, completionHandler: @escaping(Double?, Error?)->Void)
}
