//
//  TenthViewController.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/17/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import Foundation
import UIKit

class TenthViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var hourPicker: UIPickerView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minutePicker: UIPickerView!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondPicker: UIPickerView!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    
  
    
    var usersName = String()
    var warmUpSeconds = Int()
    var warmUpMinutes = Int()
    var warmUpHours = Int()
    var coolDownSeconds = Int()
    var coolDownMinutes = Int()
    var coolDownHours = Int()
    var fullRunSeconds = Int()
    var fullRunMinutes = Int()
    var fullRunHours = Int()
    var whatEdit = String()
    
    var secondPickerData = [String](repeating: "", count: 60)
    var minutePickerData = [String](repeating: "", count: 60)
    var hourPickerData = [String](repeating: "", count: 7)
    
    var editedSeconds = 0
    var editedMinutes = 0
    var editedHours = 0
    
    //var wasChanged = false
   
    
    
       override func viewDidLoad() {
        
        super.viewDidLoad()
        
        headerLabel.text = "Edit the time for the " + whatEdit + " here"
        
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
            editedSeconds = row;
            NSLog("Edited Run Second Picker Change: " + String(row));
        } else if (pickerView.tag == 2){
            editedMinutes = row;
            NSLog("Edited Run Minute Picker Change: " + String(row));
        } else {
            editedHours = row
            NSLog("Edited Hour Picker Change: " + String(row));
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveChanges" {
            if whatEdit == "run" {
                let destination : NinthViewController = segue.destination as! NinthViewController
                NSLog("Save Chages for Run")
                destination.usersName = String(usersName)
                destination.warmUpSeconds = warmUpSeconds
                destination.warmUpMinutes = warmUpMinutes
                destination.warmUpHours = warmUpHours
                destination.coolDownSeconds = coolDownSeconds
                destination.coolDownMinutes = coolDownMinutes
                destination.coolDownHours = coolDownHours
                destination.fullRunSeconds = editedSeconds
                destination.fullRunMinutes = editedMinutes
                destination.fullRunHours = editedHours
            } else if whatEdit == "warmup" {
                let destination : NinthViewController = segue.destination as! NinthViewController
                NSLog("Save Changes for Warmup")
                destination.usersName = String(usersName)
                destination.warmUpSeconds = editedSeconds
                destination.warmUpMinutes = editedMinutes
                destination.warmUpHours = editedHours
                destination.coolDownSeconds = coolDownSeconds
                destination.coolDownMinutes = coolDownMinutes
                destination.coolDownHours = coolDownHours
                destination.fullRunSeconds = fullRunSeconds
                destination.fullRunMinutes = fullRunMinutes
                destination.fullRunHours = fullRunHours
            } else {
                let destination : NinthViewController = segue.destination as! NinthViewController
                NSLog("Save Changes for Cooldown")
                destination.usersName = String(usersName)
                destination.warmUpSeconds = warmUpSeconds
                destination.warmUpMinutes = warmUpMinutes
                destination.warmUpHours = warmUpHours
                destination.coolDownSeconds = editedSeconds
                destination.coolDownMinutes = editedMinutes
                destination.coolDownHours = editedHours
                destination.fullRunSeconds = fullRunSeconds
                destination.fullRunMinutes = fullRunMinutes
                destination.fullRunHours = fullRunHours
            }
        } else if segue.identifier == "noChanges" {
            let destination : NinthViewController = segue.destination as! NinthViewController
            NSLog("Go Back With No Changes")
            destination.usersName = String(usersName)
            destination.warmUpSeconds = warmUpSeconds
            destination.warmUpMinutes = warmUpMinutes
            destination.warmUpHours = warmUpHours
            destination.coolDownSeconds = coolDownSeconds
            destination.coolDownMinutes = coolDownMinutes
            destination.coolDownHours = coolDownHours
            destination.fullRunSeconds = fullRunSeconds
            destination.fullRunMinutes = fullRunMinutes
            destination.fullRunHours = fullRunHours
        }
    }
    
   /* override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if !(wasChanged){
            return false
        }
        return true
    }*/
    
}


