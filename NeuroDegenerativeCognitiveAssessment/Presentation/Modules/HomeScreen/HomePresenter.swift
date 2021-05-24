//
//  HomePresenter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 20.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

class HomePresenter: HomeViewOutput {
    weak var view: HomeViewInput!
    private let quizService: QuizService = QuizServiceImp.instance
    
    init (view: HomeViewInput) {
        self.view = view
    }
    
    func getStatus() -> CognitiveBehaviorStatus {
        return quizService.getStatus()
    }
    
    func getNextViewControllerName() -> String {
        if quizService.currentTest.stage == .partOne {
            return "BeginQuestionnaireViewController"
        }
        return "SubsidiaryViewController"
    }
    
    private func getDateLastPassedTest() -> TimeInterval {
        let date = try? quizService.fetchPassedTests().last?.completionDate
        if let date = date {
            return date.timeIntervalSince1970
        }
        let invalidDate = (Date() - (60 * 60 * 24 * 5)).timeIntervalSince1970
        return invalidDate
    }
    
    func turnTimer() {
        let timer = Timer.scheduledTimer(timeInterval: 1.0,
                             target: self,
                             selector: #selector(timerAction(timer:)),
                             userInfo: nil, repeats: true)
        timer.tolerance = 1.0
    }
    
    @objc private func timerAction(timer: Timer) {
        let date = getDateLastPassedTest()
       // let secCount =  7 * 24 * 60 * 60 // 7 days in seconds
        let secCount = 12
       
        let time = secCount - Int(Date().timeIntervalSince1970 - date)
        view.setButton(getButtonState(timeInterval: time))
        if time < 0 {
            timer.invalidate()
        }
    }
    
    private func getButtonState(timeInterval: Int) -> CurrentButtonState {
        if timeInterval < 0 {
            return getUnlockedButtonState()
        }
        
        let days = timeInterval / (24 * 60 * 60)
        let hours = timeInterval / (60 * 60)
        if hours < 1 {
            let minutes = timeInterval / 60
            let text = minutes.description + " " + String.ButtonStatus.minutesUntilNextSession
            return CurrentButtonState(title: text, isEnabled: false)
        } else if days < 1 {
            let text = hours.description + " " + String.ButtonStatus.hoursUntilNextSession
            return CurrentButtonState(title: text, isEnabled: false)
        } else {
            let text = days.description + " " + String.ButtonStatus.daysUntilNextSession
            return CurrentButtonState(title: text, isEnabled: false)
        }
    }
    
    private func getUnlockedButtonState() -> CurrentButtonState {
        if quizService.currentTest.stage == .partOne {
            return CurrentButtonState(title: String.ButtonStatus.beginQuiz, isEnabled: true)
        }
        return CurrentButtonState(title: String.ButtonStatus.continueQuiz, isEnabled: true)
    }
}
