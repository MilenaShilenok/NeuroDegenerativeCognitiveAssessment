//
//  SelectableImageButton.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 13.11.2020.
//  Copyright © 2020 Милена. All rights reserved.
//

import UIKit

protocol SelectableImageViewDelegate {
    func didSelect(selectableImageView: SelectableImageView)
}

class SelectableImageView: UIImageView {
    
    private var dimmingView: UIView!
    var delegate: SelectableImageViewDelegate?
    var option: Option?
    
    var state: SelectableImageView.State = .undefined {
        didSet {
            updateState()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        dimmingView.frame = bounds
    }
    
    private func updateState() {
        switch state {
        case .selected:
            layer.borderWidth = 5
            dimmingView.alpha = 0
        case .undefined:
            layer.borderWidth = 0
            dimmingView.alpha = 0
        case .notSelected:
            layer.borderWidth = 0
            dimmingView.alpha = 0.5
        }
    }
    
    private func setupInitialState() {
        layer.borderColor = UIColor.green.cgColor
        setupDimmingView()
        setupGestureRecognizer()
    }
    
    private func setupDimmingView() {
        dimmingView = UIView(frame: frame)
        dimmingView.backgroundColor = .black
        dimmingView.alpha = 0
        addSubview(dimmingView)
    }
    
    private func setupGestureRecognizer() {
        let gr = UITapGestureRecognizer(target: self, action: #selector(didTapped))
        isUserInteractionEnabled = true
        addGestureRecognizer(gr)
    }
    
    @objc private func didTapped() {
        delegate?.didSelect(selectableImageView: self)
    }
    
    func set(option: Option) {
        self.option = option
        
        let imageName = option.value
        let image = UIImage(named: imageName)
        self.image = image
    }
}

extension SelectableImageView {
    enum State {
        case undefined
        case selected
        case notSelected
    }
}
