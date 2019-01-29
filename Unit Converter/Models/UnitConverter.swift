//
//  UnitConverter.swift
//  Unit Converter
//
//  Created by Harmanpreet Kaur on 21/01/19.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import Foundation

class UnitConverter {
    func degreesToFarenheit(degreesCelcius: Int) -> Int {
        return (Int(1.8 * Float(degreesCelcius) + 32.0))
//        return 0.0
    }
    func FarenheitToDegrees(farenheit: Int) -> Int {
        return (Int((Float(farenheit) - 32.0)/1.8))
    }
    
}
