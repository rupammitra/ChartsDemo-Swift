//
//  BarGraphViewController.swift
//  ChartsDemo-Swift
//
//  Created by Rupam Mitra on 01/08/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit

class BarGraphViewController: BaseGraphViewController {
    
    override func viewDidLoad() {
        chartIdentifier = String(BarChartView)
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        formChartData()
        
        chartView.setVisibleXRangeMaximum(15.0)
        chartView.animate(yAxisDuration: 0.5, easingOption: .Linear)
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
        
        var yVals: [BarChartDataEntry]!
        var dataSets = [BarChartDataSet]()
        
        var keys = Array(dataArray[0].keys)
        keys.sortInPlace()
        
        for (_, key) in keys.enumerate() {
            if key != "x" {
                yVals = [BarChartDataEntry]()
                var dataSet: BarChartDataSet!
                for (dataIndex, data) in dataArray.enumerate() {
                    let markerString = " \(key.uppercaseString): \(data[key]!)"
                    yVals.append(BarChartDataEntry(value: data[key]!.doubleValue, xIndex: dataIndex, data: markerString))
                }
                dataSet = CDSBarChartDataSet(yVals: yVals, label: key.uppercaseString, color: UIColor.randomColor(), barSpace: 0.0)
                dataSets.append(dataSet)
            }
        }
        
        chartView.data = CDSBarChartData(xVals: xVals, dataSets: dataSets, drawValues: false, groupSpace: 1.0, highlightedEnabled: true)
    }
}
