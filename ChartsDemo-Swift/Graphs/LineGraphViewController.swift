//
//  LineGraphViewController.swift
//  ChartsDemo-Swift
//
//  Created by Rupam Mitra on 01/08/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit

class LineGraphViewController: BaseGraphViewController {
    
    override func viewDidLoad() {
        chartIdentifier = String(LineChartView)
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        formChartData()
        
        chartView.setVisibleXRangeMaximum(5.0)
        chartView.animate(xAxisDuration: 0.5, easingOption: .Linear)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func formChartData() {
        
        var xVals = [String]()
        for obj in dataArray {
            xVals.append(obj["x"] as! String)
        }
        
        var yVals: [ChartDataEntry]!
        var dataSets = [LineChartDataSet]()
        
        var keys = Array(dataArray[0].keys)
        keys.sortInPlace()
        
        for (_, key) in keys.enumerate() {
            if key != "x" {
                yVals = [ChartDataEntry]()
                let color = UIColor.randomColor()
                var dataSet: LineChartDataSet!
                for (dataIndex, data) in dataArray.enumerate() {
                    let markerString = " \(key.uppercaseString): \(data[key]!)"
                    yVals.append(ChartDataEntry(value: data[key]!.doubleValue, xIndex: dataIndex, data: markerString))
                }
                dataSet = CDSLineChartDataSet(yVals: yVals, label: key.uppercaseString, color: color, circleColor: color, circleRadius: 3.0, filledEnabled: filledEnabled, fillAlpha: 0.2, fillColor: color)
                dataSets.append(dataSet)
            }
        }
        
        chartView.data = CDSLineChartData(xVals: xVals, dataSets: dataSets, drawValues: false)
    }
}
