//
//  ThirdViewController.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/12/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController,UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var coolDownQ: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var hourPicker: UIPickerView!
    @IBOutlet weak var minutePicker: UIPickerView!
    @IBOutlet weak var secondPicker: UIPickerView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var hiddenLabel: UILabel!
    
    
    
    
    @IBAction func yesButtonClicked(_ sender: UIButton) {
        coolDownQ.isHidden = false
        hourPicker.isHidden = false
        minutePicker.isHidden = false
        secondPicker.isHidden = false
        hourLabel.isHidden = false
        minuteLabel.isHidden = false
        secondLabel.isHidden = false
        yesButton.isHidden = true
        noButton.isHidden = true
        hiddenLabel.isHidden = true
        continueButton.isHidden = false
    }
    
    @IBAction func noButtonClicked(_ sender: UIButton) {
    }
    
    var secondPickerData = [String](repeating: "", count: 60)
    var minutePickerData = [String](repeating: "", count: 60)
    var hourPickerData = [String](repeating: "", count: 6)
    var usersName = String()
    var warmUpSeconds = Int()
    var warmUpMinutes = Int()
    var warmUpHours = Int()
    var cooldownSeconds = 0
    var cooldownMinutes = 0
    var cooldownHours = 0
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coolDownQ.isHidden = true
        secondPicker.isHidden = true
        minutePicker.isHidden = true
        hourPicker.isHidden = true
        secondLabel.isHidden = true
        minuteLabel.isHidden = true
        hourLabel.isHidden = true
        continueButton.isHidden = true
        
        if usersName != "" {
            hiddenLabel.text = usersName + ", are you doing a cooldown?"
        } else {
            hiddenLabel.text = "Are you planning on doing a cooldown?"
        }
        
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
            cooldownSeconds = row;
            NSLog("Cooldown Second Picker Change: " + String(row));
        } else if (pickerView.tag == 2){
            cooldownMinutes = row;
            NSLog("Cooldown Minute Picker Change: " + String(row));
        } else {
            cooldownHours = row
            NSLog("Cooldown Hour Picker Change: " + String(row));
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination : FourthViewController = segue.destination as! FourthViewController
        destination.usersName = String(usersName)
        destination.warmUpSeconds = warmUpSeconds
        destination.warmUpMinutes = warmUpMinutes
        destination.warmUpHours = warmUpHours
        destination.coolDownSeconds = cooldownSeconds
        destination.coolDownMinutes = cooldownMinutes
        destination.coolDownHours = cooldownHours
    }


}













