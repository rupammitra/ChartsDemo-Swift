//
//  BaseGraphViewController.swift
//  ChartsDemo-Swift
//
//  Created by Rupam Mitra on 01/08/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit

class BaseGraphViewController: UIViewController {
    
    var chartIdentifier: String?
    var chartView: BarLineChartViewBase!
    var filledEnabled: Bool!
    var dataArray: [[String: AnyObject]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch chartIdentifier! {
            case String(BarChartView):
                chartView = BarChartView(frame: self.view.bounds)
            case String(LineChartView):
                chartView = LineChartView(frame: self.view.bounds)
            default:
                print("No Identifier")
        }
        self.view.addSubview(chartView)
        
        let pinTop = NSLayoutConstraint(item: chartView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0)
        let pinTrailing = NSLayoutConstraint(item: chartView, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        let pinBottom = NSLayoutConstraint(item: chartView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        let pinLeading = NSLayoutConstraint(item: chartView, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        chartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([pinTop, pinTrailing, pinBottom, pinLeading])
        
        self.view.backgroundColor = UIColor.clearColor()
        chartView.backgroundColor = UIColor.clearColor()
        configureChart()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureChart() {
        
        chartView.noDataText = ""
        
        chartView.gridBackgroundColor = UIColor.clearColor()
        
        chartView.descriptionText = ""
        chartView.descriptionTextColor = UIColor.clearColor()
        
        chartView.pinchZoomEnabled = true
        chartView.doubleTapToZoomEnabled = true
        
        let leftAxis: ChartYAxis = chartView.leftAxis
        leftAxis.labelFont = UIFont.systemFontOfSize(12.0)
        leftAxis.labelTextColor = UIColor.randomColor()
        leftAxis.valueFormatter?.maximumFractionDigits = 2
        leftAxis.drawGridLinesEnabled = true
        leftAxis.axisMinValue = 0.0
        
        let rightAxis: ChartYAxis = chartView.rightAxis
        rightAxis.enabled = false
        
        let xAxis: ChartXAxis = chartView.xAxis
        xAxis.labelFont = UIFont.systemFontOfSize(12.0)
        xAxis.labelTextColor = UIColor.randomColor()
        xAxis.labelPosition = .Bottom
        xAxis.drawGridLinesEnabled = true
        
        let legend: ChartLegend = chartView.legend
        legend.enabled = true
        legend.verticalAlignment = ChartLegend.VerticalAlignment.Bottom
        legend.horizontalAlignment = ChartLegend.HorizontalAlignment.Center
        
        //this is to show the pop up on chart selection
        let marker: Marker  = Marker(color: UIColor.randomColor(), font: UIFont.systemFontOfSize(12.0), insets: UIEdgeInsetsMake(5.0, 0.0, 0.0, 5.0))
        marker.minimumSize = CGSizeMake(50.0, 35.0)
        chartView.marker = marker
    }
}
