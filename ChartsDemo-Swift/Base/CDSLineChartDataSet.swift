//
//  CDSLineChartDataSet.swift
//  ChartsDemo-Swift
//
//  Created by Rupam Mitra on 01/08/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit

class CDSLineChartDataSet: LineChartDataSet {
    
    init(yVals: [ChartDataEntry]?, label: String?, color: UIColor?, circleColor: UIColor?, circleRadius: CGFloat?, filledEnabled: Bool?, fillAlpha: CGFloat?, fillColor: UIColor?) {
        super.init(yVals: yVals, label: label)
        self.setColor(color!)
        self.setCircleColor(color!)
        self.circleRadius = circleRadius!
        if filledEnabled != nil && filledEnabled! == true {
            self.drawFilledEnabled = true
            self.fillColor = fillColor!
            self.fillAlpha = fillAlpha!
        }
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}
