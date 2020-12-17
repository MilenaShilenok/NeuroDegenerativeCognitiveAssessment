//
//  Aclass.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 15.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import Foundation
import UIKit

class Aclass: UIViewController {
    var i = 0
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var vieW: UIView!
   
    @IBAction func ButtonAction(_ sender: Any) {
        i += 1
       /* if i < 5 {
            let imageBlack = image
            if let image2 = imageBlack {
                image2.image = UIImage(named: "")
                let black = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
                image2.backgroundColor = black
            }*/
        let im = UIImageView(image: UIImage.cat)
                image.addSubview(im)
                print("A")
        if i > 3 {
            im.image = UIImage(named: "")
        }
       /* } else {
            let imageBlack = image
            if let image2 = imageBlack {
                image2.image = UIImage(named: "")
                image2.backgroundColor = .clear
            }
            
        }*/
    }
}
