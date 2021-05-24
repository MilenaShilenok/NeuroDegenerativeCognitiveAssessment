//
//  ExportResultsViewController.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 03.04.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit

class ExportResultsViewController: UIViewController, ExportResultsViewInput {
    @IBOutlet weak var noQuestionnaireResultsLabel: UILabel!
    @IBOutlet weak var exportLabel: UILabel!
    @IBOutlet weak var exportButton: DefaultButton!
    
    var output: ExportResultsViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = ExportResultsPresenter(view: self)
        setupInitialState()
    }
    
    private func setupInitialState() {
        exportButton.titleLabel?.text = String.Export.export
        exportButton.layer.cornerRadius = 17
        exportLabel.text = String.Export.exportDescription
        noQuestionnaireResultsLabel.text = String.Export.noQuestionnaireResults
        if output.hasPassedTests {
            displayExportDescription()
        } else {
            noQuestionnaireResults()
        }
    }
    
    private func noQuestionnaireResults() {
        exportButton.isHidden = true
        exportLabel.isHidden = true
        noQuestionnaireResultsLabel.isHidden = false
    }
    
    private func displayExportDescription() {
        exportButton.isHidden = false
        exportLabel.isHidden = false
        noQuestionnaireResultsLabel.isHidden = true
    }
    
    @IBAction func export(_ sender: Any) {
        do {
            let url = try output.getFileUrl()
            let vc = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            present(vc, animated: true, completion: nil)
        } catch {
            show(error: error)
        }
    }
}
