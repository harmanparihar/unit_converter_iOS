//
//  TemperatureRange.swift
//  Unit Converter
//
//  Created by Harmanpreet Kaur on 21/01/19.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//
import UIKit
import Foundation

class TemperatureRange: NSObject, UIPickerViewDataSource{
    
    let values = (-100...100).map{ $0 } //closure
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    
}

