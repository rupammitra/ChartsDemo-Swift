//
//  CDSBarChartData.swift
//  ChartsDemo-Swift
//
//  Created by Rupam Mitra on 01/08/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import UIKit

class CDSBarChartData: BarChartData {
    
    init(xVals: [NSObject]?, dataSets: [IChartDataSet]?, drawValues: Bool?, groupSpace: CGFloat?, highlightedEnabled: Bool?) {
        super.init(xVals: xVals, dataSets: dataSets)
        self.setDrawValues(drawValues!)
        self.groupSpace = groupSpace!
        self.highlightEnabled = highlightedEnabled!
    }
}
