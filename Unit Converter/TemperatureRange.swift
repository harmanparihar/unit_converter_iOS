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
    
    var values = (-180...180).map{ $0 } //closure
    func range ( unit:String ){
        if unit == "c"{
            values = (-148...212).map{ $0 } //closure
//            for index in 0..<values.count{
//                values[index] = (Int(1.8 * Float(values[index]) + 32.0))
//            }
            
        }
        else{
            values = (-180...180).map{ $0 }
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return values.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    
}

