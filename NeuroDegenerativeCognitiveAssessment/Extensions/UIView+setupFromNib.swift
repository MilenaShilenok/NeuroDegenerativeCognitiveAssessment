//
//  UIView+setupFromNib.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 27.02.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

extension UIView {
    func setupFromNib() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView? {
        let name = String(describing: type(of: self))
        let nib = UINib(nibName: name, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
