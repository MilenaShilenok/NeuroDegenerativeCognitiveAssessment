//
//  LongAnswerServiceImp.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 06.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class LongAnswerServiceImp: LongAnswerService {
    
    static let instance = LongAnswerServiceImp()
    private init() {}
    
    func getGunningFog(text: String, completionHandler: @escaping(Double?, Error?)->Void) {
        let url = "https://ipeirotis-readability-metrics.p.rapidapi.com/getReadabilityMetrics"
        let params: Parameters = ["text": text]
        let headers: HTTPHeaders = ["x-rapidapi-host": "ipeirotis-readability-metrics.p.rapidapi.com",
                                    "x-rapidapi-key": "9e3e4ba00amsh77ecb2a6ef93b17p1bc968jsn122bb0d8500f",
                                    "content-type": "application/x-www-form-urlencoded",
                                    "useQueryString": "true"]
        AF.request(url, method: .post, parameters: params, headers: headers).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                guard let dict = value as? [String: Any],
                      let gunningFog = dict["GUNNING_FOG"] as? Double else {
                    completionHandler(nil, SystemError.custom("error mapping"))
                    return
                }
                completionHandler(gunningFog, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
}
