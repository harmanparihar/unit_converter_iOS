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
    
    //New code
    
    @IBOutlet weak var uiSegmentedControl: UISegmentedControl!
    @IBAction func indexChanged(_ sender: Any) {
        let defaultpicker = initialPickerRow()
        if uiSegmentedControl.selectedSegmentIndex == 0{
            print("Farenheit Options execute")
            temperatureRange.range(unit: "f")
            tempPicker.reloadAllComponents()
            tempPicker.selectRow( defaultpicker, inComponent: 0 , animated:true)
            pickerView(tempPicker, didSelectRow: defaultpicker, inComponent: 0)
            uiSegmentedControl.setEnabled(true, forSegmentAt: 0)
            saveSelectedSegmentedControlIndex(index: 0)
            
        }else{
            print("Celcius Options execute")
            temperatureRange.range(unit: "c")
            tempPicker.reloadAllComponents()
            tempPicker.selectRow( defaultpicker, inComponent: 0 , animated:true)
            pickerView(tempPicker, didSelectRow: defaultpicker, inComponent: 0)
            uiSegmentedControl.setEnabled(true, forSegmentAt: 1)
            saveSelectedSegmentedControlIndex(index: 1)
        }
    }
    //End of new code
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempPicker.delegate = self
        uiSegmentedControl.selectedSegmentIndex = initialSegmentedControlIndex()
        let defaultpicker = initialPickerRow()
        tempPicker.selectRow( defaultpicker, inComponent: 0 , animated:true)
        pickerView(tempPicker, didSelectRow: defaultpicker, inComponent: 0)
       
    }
    func initialSegmentedControlIndex()->Int{
        if let savedIndex = UserDefaults.standard.object(forKey: "unitIndex") as? Int{
            return savedIndex
        }
        return 0
    }
    func initialPickerRow() -> Int{
        if let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int{
            return savedRow
        }
        return tempPicker.numberOfRows(inComponent: 0)/2
    }
    func saveSelectedSegmentedControlIndex(index: Int){
        let defaults = UserDefaults.standard
        defaults.set(index, forKey: "unitIndex")
        defaults.synchronize()
    }
    func saveSelectedRow(row: Int){
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: "defaultCelciusPickerRow")
        defaults.synchronize()
    }
    func displayConvertedTemperatureForRowF(row: Int){
        let celciusValue = temperatureRange.values[row]
        tempLabel.text = "\(unitConverter.degreesToFarenheit(degreesCelcius: celciusValue))°F"
    }
    func displayConvertedTemperatureForRowC(row: Int){
        let FarenheitValue = temperatureRange.values[row]
        tempLabel.text = "\(unitConverter.FarenheitToDegrees(farenheit: FarenheitValue))°C"
    }
}

extension ViewController: UIPickerViewDelegate{

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if uiSegmentedControl.selectedSegmentIndex == 0{
            return "\(temperatureRange.values[row])°C"
        } else {
            return "\(temperatureRange.values[row])°F"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if uiSegmentedControl.selectedSegmentIndex == 0{
            print("Picker row was tapped")
            temperatureRange.range(unit: "c")
            tempPicker.reloadAllComponents()
            displayConvertedTemperatureForRowF(row: row)
            saveSelectedRow(row: row)
        } else {
            print("Picker row was tapped")
            temperatureRange.range(unit: "f")
            tempPicker.reloadAllComponents()
            displayConvertedTemperatureForRowC(row: row)
            saveSelectedRow(row: row)
        }
        
    }
    
}
