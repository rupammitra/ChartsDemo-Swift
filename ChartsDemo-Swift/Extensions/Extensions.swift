//
//  Extensions.swift
//  ChartsDemo-Swift
//
//  Created by Rupam Mitra on 01/08/16.
//  Copyright © 2016 Rupam Mitra. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func randomColor() -> UIColor {
        let red: CGFloat = CGFloat(arc4random_uniform(255)) / 255.0
        let green = CGFloat(arc4random_uniform(255)) / 255.0
        let blue = CGFloat(arc4random_uniform(255)) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}