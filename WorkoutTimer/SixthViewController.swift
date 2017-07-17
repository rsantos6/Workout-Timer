//
//  SixthViewController.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/14/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import Foundation
import UIKit

class SixthViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var sixthLabel: UILabel!
    @IBOutlet weak var hourPicker: UIPickerView!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondPicker: UIPickerView!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var minutePicker: UIPickerView!
    @IBOutlet weak var hourLabel: UILabel!
    
    
    var usersName = String()
    var warmUpSeconds = Int()
    var warmUpMinutes = Int()
    var warmUpHours = Int()
    var coolDownSeconds = Int()
    var coolDownMinutes = Int()
    var coolDownHours = Int()
    
    var secondPickerData = [String](repeating: "", count: 60)
    var minutePickerData = [String](repeating: "", count: 60)
    var hourPickerData = [String](repeating: "", count: 7)
    
    var regularRunSeconds = 0
    var regularRunMinutes = 0
    var regularRunHours = 0
    
    
    override func viewDidLoad() {
        NSLog("in class")
        super.viewDidLoad()
        
        self.secondPicker.delegate = self
        self.secondPicker.dataSource = self
        
        self.minutePicker.delegate = self
        self.minutePicker.dataSource = self
        
        self.hourPicker.delegate = self
        self.hourPicker.dataSource = self
        
        var seconds = 0
        while seconds < 60 {
            if seconds < 10 {
                secondPickerData[seconds] = "0" + String(seconds)
                minutePickerData[seconds] = "0" + String(seconds)
            } else {
                secondPickerData[seconds] = String(seconds)
                minutePickerData[seconds] = String(seconds)
            }
            seconds += 1
        }
        
        var sec = 0
        while sec < 6 {
            hourPickerData[sec] = "0" + String(sec)
            sec += 1
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == secondPicker {
            return secondPickerData.count
        } else if pickerView == minutePicker {
            return minutePickerData.count
        } else {
            return hourPickerData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == secondPicker {
            return secondPickerData[row]
        } else if pickerView == minutePicker {
            return minutePickerData[row]
        } else {
            return hourPickerData[row]
        }
    }
    
    
    
    // Capture the picker view selection
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        if (pickerView.tag == 3){
            regularRunSeconds = row;
            NSLog("Regular Run Second Picker Change: " + String(row));
        } else if (pickerView.tag == 2){
            regularRunMinutes = row;
            NSLog("Regular Run Minute Picker Change: " + String(row));
        } else {
            regularRunHours = row
            NSLog("Regular Run Hour Picker Change: " + String(row));
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination : NinthViewController = segue.destination as! NinthViewController
        NSLog("in segue")
        destination.usersName = String(usersName)
        destination.warmUpSeconds = warmUpSeconds
        destination.warmUpMinutes = warmUpMinutes
        destination.warmUpHours = warmUpHours
        destination.coolDownSeconds = coolDownSeconds
        destination.coolDownMinutes = coolDownMinutes
        destination.coolDownHours = coolDownHours
        destination.fullRunSeconds = regularRunSeconds
        destination.fullRunMinutes = regularRunMinutes
        destination.fullRunHours = regularRunHours
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (regularRunSeconds == 0) && (regularRunMinutes == 0) && (regularRunHours == 0){
            let alertController = UIAlertController(title: "Workout Timer", message:
                "Please specify running time", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            return false
        }
        return true
    }

    
    
    
}

