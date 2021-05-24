//
//  HistoryHeaderView.swift
//  NeuroDegenerativeCognitiveAssessment
//
//  Created by Милена on 20.03.2021.
//  Copyright © 2021 Милена. All rights reserved.
//

import UIKit
import Charts

class HistoryHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var chartView: LineChartView!
    
    static let identifier = "HistoryHeaderView"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
    func buildGraph(points: [Point]) {
        var dataEntries: [ChartDataEntry] = []
        var dateDescription: [String] = []
        for point in points {
            let dataEntry = ChartDataEntry(x: point.x, y: point.y, data: point.dateDescription as AnyObject)
            dataEntries.append(dataEntry)
            dateDescription.append(point.dateDescription)
        }
        
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: nil)
        chartDataSet.setColor(UIColor.blue)
        chartDataSet.lineWidth = 2
        chartDataSet.circleRadius = 5
        chartDataSet.circleHoleRadius = 2
        chartDataSet.circleColors = [NSUIColor.blue]
        chartDataSet.drawValuesEnabled = false

        let chartData = LineChartData(dataSets: [chartDataSet])
        chartView.data = chartData
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: dateDescription)
    }
    
    private func setupInitialState() {
        chartView.scaleYEnabled = false
        chartView.scaleXEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.rightAxis.drawLabelsEnabled = false
        chartView.rightAxis.drawAxisLineEnabled = false
        chartView.rightAxis.drawGridLinesEnabled = false
        chartView.drawGridBackgroundEnabled = false
        chartView.leftAxis.drawGridLinesEnabled = false
        chartView.doubleTapToZoomEnabled = true
        chartView.legend.enabled = false
        chartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        chartView.xAxis.avoidFirstLastClippingEnabled = true
    }
}
