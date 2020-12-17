//
//  A.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 15.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class Aclass: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapRecognizer:)))
        
        imageView.addGestureRecognizer(tapRecognizer)
        imageView.isUserInteractionEnabled = true
    }

    @objc private func imageTapped(tapRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapRecognizer.view as! UIImageView
        print("Tapped on Image")
        
        // Your action
    }
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }*/
    
}
