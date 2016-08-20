//
//  CDSLineChartData.swift
//  ChartsDemo-Swift
//
//  Created by Rupam Mitra on 01/08/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit

class CDSLineChartData: LineChartData {
    
    init(xVals: [NSObject]?, dataSets: [IChartDataSet]?, drawValues: Bool?) {
        super.init(xVals: xVals, dataSets: dataSets)
        self.setDrawValues(drawValues!)
    }
}
