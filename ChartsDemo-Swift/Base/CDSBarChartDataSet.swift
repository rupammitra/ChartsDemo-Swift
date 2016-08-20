//
//  CDSBarChartDataSet.swift
//  ChartsDemo-Swift
//
//  Created by Rupam Mitra on 01/08/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit

class CDSBarChartDataSet: BarChartDataSet {
    
    init(yVals: [ChartDataEntry]?, label: String?, color: UIColor?, barSpace: CGFloat?) {
        super.init(yVals: yVals, label: label)
        self.setColor(color!)
        self.barSpace = barSpace!
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}
