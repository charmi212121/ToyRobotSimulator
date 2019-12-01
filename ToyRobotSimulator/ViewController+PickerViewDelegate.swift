//
//  ViewController+PickerViewDelegate.swift
//  ToyRobotSimulator
//
//  Created by Charmi Sutariya on 01/12/19.
//  Copyright © 2019 Charmi Sutariya. All rights reserved.
//

import UIKit


// MARK: PickerView Delegate


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    // MARK: PickerView Data Source Delegate Methods
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerViewData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[component][row]
    }

    
    
    // MARK: PickerView Delegate Methods
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch component {
        case 0:
            selectedXValue = row
        case 1:
            selectedYValue = row
        case 2:
            selectedDirectionValue = row
        default:
            return
        }
        
    }
}
