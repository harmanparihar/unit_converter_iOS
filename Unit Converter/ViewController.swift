//
//  ViewController.swift
//  Unit Converter
//
//  Created by Harmanpreet Kaur on 21/01/19.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var temperatureRange: TemperatureRange!
    let unitConverter = UnitConverter()
    let userDefaultsLastRowKey="defaultCelciusPickerRow"
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tempPicker.delegate = self
        let defaultpicker = temperatureRange.values.count/2
        
        tempPicker.selectRow( defaultpicker, inComponent: 0 , animated:true)
        pickerView(tempPicker, didSelectRow: defaultpicker, inComponent: 0)
        
    }
    func initialPickerRow() -> Int{
        if let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int{
            return savedRow
        }
        return tempPicker.numberOfRows(inComponent: 0)/2
    }
    func saveSelectedRow(row: Int){
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: "defaultCelciusPickerRow")
        defaults.synchronize()
    }
    func displayConvertedTemperatureForRow(row: Int){
        let celciusValue = temperatureRange.values[row]
        tempLabel.text = "\(unitConverter.degreesToFarenheit(degreesCelcius: celciusValue))°F"
    }
}

extension ViewController: UIPickerViewDelegate{

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(temperatureRange.values[row])°C"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Picker row was tapped")
       displayConvertedTemperatureForRow(row: row)
        saveSelectedRow(row: row)
    }
    
}
