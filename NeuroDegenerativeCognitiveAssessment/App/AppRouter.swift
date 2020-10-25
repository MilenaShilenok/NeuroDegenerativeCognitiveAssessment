//
//  AppRouter.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 16.10.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

final class AppRouter {
    
    enum ModuleType {
        case profile
        case main
        case home
        case fillingProfile
        
        var storyboardName: String {
            switch self {
            case .profile:
                return String.Storyboard.profile
            case .main:
                return String.Storyboard.main
            case .home:
                return String.Storyboard.home
            case .fillingProfile:
                return String.Storyboard.fillingProfile
            }
        }
    }
    
    private var window: UIWindow!
    
    static let shared = AppRouter()
    
    private init() {
           if #available(iOS 13.0, *) {
               let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
               window = sceneDelegate?.window
           } else {
               let appDelegate = UIApplication.shared.delegate as? AppDelegate
               window = appDelegate?.window
           }
       }
    
    
    func openInitialModule() {
        let service = ProfileServiceImp.instance
        
        if !service.hasProfile {
            openModule(type: .fillingProfile)
        } else {
            openModule(type: .home)
        }
    }
    
    func openModule(type: ModuleType, options: UIView.AnimationOptions = [.transitionFlipFromRight]) {
        let storyboard = UIStoryboard(name: type.storyboardName, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        UIView.transition(with: window, duration: 0.3, options: options, animations: {
            self.window.rootViewController = vc
        }, completion: nil)
        
    }
    
    
}
