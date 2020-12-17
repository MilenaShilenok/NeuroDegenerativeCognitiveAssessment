//
//  NoViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 16.12.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class NoViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var vieW: UIView!
    //  override func prepareForInterfaceBuilder() {
  //      super.prepareForInterfaceBuilder()
      //  a()
  //  }
    
   /* override func viewDidLoad() {
        super.viewDidLoad()
        a()
    }*/
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        a()
        vieW.drawCircleWith(value: 100)
    }
    
    func a() {
        let button = ButtonForQuiz(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.backgroundColor = UIColor.blue
        stackView.addArrangedSubview(button)
       // CGRect(origin: <#T##CGPoint#>, size: <#T##CGSize#>)
       // CGPoint(
    }
    
}
