//
//  SeventhViewController.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/14/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import Foundation
import UIKit

class SeventhViewController: UIViewController,UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var seventhLabel: UILabel!
    
    @IBOutlet weak var intervalPicker: UIPickerView!
    
    @IBOutlet weak var intervalHourPicker: UIPickerView!
    @IBOutlet weak var intervalMinutePicker: UIPickerView!
    @IBOutlet weak var intervalSecondPicker: UIPickerView!
    
    @IBOutlet weak var jogHourPicker: UIPickerView!
    @IBOutlet weak var jogMinutePicker: UIPickerView!
    @IBOutlet weak var jogSecondPicker: UIPickerView!
    
    @IBOutlet weak var pickUpLabel: UILabel!
    @IBOutlet weak var restLabel: UILabel!
    
    @IBAction func customizeAction(_ sender: UIButton) {
        toCustomize = true
    }
    
    
    
    var usersName = String()
    var warmUpSeconds = Int()
    var warmUpMinutes = Int()
    var warmUpHours = Int()
    var coolDownSeconds = Int()
    var coolDownMinutes = Int()
    var coolDownHours = Int()
    var isJog = Bool()
    
    var numberOfIntervals = 1
    
    var onIntervalHours = 0
    var onIntervalMinutes = 0
    var onIntervalSeconds = 0
    
    var jogHours = 0
    var jogMinutes = 0
    var jogSeconds = 0
    
    var toCustomize = false
    
    var intervalPickerData = [String](repeating: "", count: 51)
    
    var onIntervalHourPickerData = [String](repeating: "", count: 6)
    var onIntervalMinutePickerData = [String](repeating: "", count: 60)
    var onIntervalSecondPickerData = [String](repeating: "", count: 60)
    
    var jogHourPickerData = [String](repeating: "", count: 6)
    var jogMinutePickerData = [String](repeating: "", count: 60)
    var jogSecondPickerData = [String](repeating: "", count: 60)
    
    
    override func viewDidLoad() {
        NSLog("in class")
        super.viewDidLoad()
        
        if (!isJog) {
            pickUpLabel.text = "Interval\nlength:"
            restLabel.text = "Rest\nlength:"
        }
        
        self.intervalPicker.delegate = self
        
        self.intervalHourPicker.delegate = self
        self.intervalMinutePicker.delegate = self
        self.intervalSecondPicker.delegate = self
        
        self.jogHourPicker.delegate = self
        self.jogMinutePicker.delegate = self
        self.jogSecondPicker.delegate = self
        
        
        var seconds = 1
        while seconds < 51 {
            if seconds < 10 {
                intervalPickerData[seconds-1] = "0" + String(seconds)
            } else {
                intervalPickerData[seconds-1] = String(seconds)
            }
            seconds += 1
        }
        
        var intervalSeconds = 0
        while intervalSeconds < 60 {
            if intervalSeconds < 10 {
                
                onIntervalSecondPickerData[intervalSeconds] = "0" + String(intervalSeconds)
                onIntervalMinutePickerData[intervalSeconds] = "0" + String(intervalSeconds)
                
                jogSecondPickerData[intervalSeconds] = "0" + String(intervalSeconds)
                jogMinutePickerData[intervalSeconds] = "0" + String(intervalSeconds)
                
            } else {
                
                onIntervalSecondPickerData[intervalSeconds] = String(intervalSeconds)
                onIntervalMinutePickerData[intervalSeconds] = String(intervalSeconds)
                
                jogSecondPickerData[intervalSeconds] = String(intervalSeconds)
                jogMinutePickerData[intervalSeconds] = String(intervalSeconds)
            }
            intervalSeconds += 1
        }
        
        var interSec = 0
        while interSec < 6 {
            onIntervalHourPickerData[interSec] = "0" + String(interSec)
            jogHourPickerData[interSec] = "0" + String(interSec)
            interSec += 1
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
        
        if pickerView == intervalPicker {
            return intervalPickerData.count
            
        } else if pickerView == intervalMinutePicker {
            return onIntervalMinutePickerData.count
            
        } else if pickerView == intervalSecondPicker {
            return onIntervalSecondPickerData.count
            
        } else if pickerView == intervalHourPicker {
            return onIntervalHourPickerData.count
            
        } else if pickerView == jogHourPicker {
            return jogHourPickerData.count
            
        } else if pickerView == jogMinutePicker {
            return jogMinutePickerData.count
            
        } else if pickerView == jogSecondPicker {
            return jogSecondPickerData.count
        }

        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == intervalPicker {
            return intervalPickerData[row]
            
        } else if pickerView == intervalMinutePicker {
            return onIntervalMinutePickerData[row]
            
        } else if pickerView == intervalSecondPicker {
            return onIntervalSecondPickerData[row]
            
        } else if pickerView == intervalHourPicker {
            return onIntervalHourPickerData[row]
            
        } else if pickerView == jogHourPicker {
            return jogHourPickerData[row]
            
        } else if pickerView == jogMinutePicker {
            return jogMinutePickerData[row]
            
        } else if pickerView == jogSecondPicker {
            return jogSecondPickerData[row]
        }
        
        return nil
    }
    
    
    
    // Capture the picker view selection
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        if pickerView.tag == 1 {
            numberOfIntervals = row+1;
            NSLog("Number of intervals: " + String(numberOfIntervals));
            
        } else if pickerView.tag == 2 {
            onIntervalHours = row
            NSLog("Pick up hours: " + String(onIntervalHours))
            
        } else if pickerView.tag == 3 {
            onIntervalMinutes = row
            NSLog("Pick up minutes: " + String(onIntervalMinutes))
            
        } else if pickerView.tag == 4 {
            onIntervalSeconds = row
            NSLog("Pick up seconds: " + String(onIntervalSeconds))
            
        } else if pickerView.tag == 5 {
            jogHours = row
            NSLog("Jogging hours: " + String(jogHours))
            
        } else if pickerView.tag == 6 {
            jogMinutes = row
            NSLog("Jogging minutes: " + String(jogMinutes))
            
        } else if pickerView.tag == 7 {
            jogSeconds = row
            NSLog("Jogging seconds: " + String(jogSeconds))
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if toCustomize {
            
            let destination : FourteenthViewController = segue.destination as! FourteenthViewController
            NSLog("in segue")
            destination.usersName = String(usersName)
            destination.warmUpSeconds = warmUpSeconds
            destination.warmUpMinutes = warmUpMinutes
            destination.warmUpHours = warmUpHours
            destination.coolDownSeconds = coolDownSeconds
            destination.coolDownMinutes = coolDownMinutes
            destination.coolDownHours = coolDownHours
            destination.numberOfIntervals = numberOfIntervals
            destination.pickUpHours = onIntervalHours
            destination.pickUpMinutes = onIntervalMinutes
            destination.pickUpSeconds = onIntervalSeconds
            destination.jogHours = jogHours
            destination.jogMinutes = jogMinutes
            destination.jogSeconds = jogSeconds
            destination.isJog = isJog

        } else {
            
            let destination : TwelfthViewController = segue.destination as! TwelfthViewController
            NSLog("in segue")
            destination.usersName = String(usersName)
            destination.warmUpSeconds = warmUpSeconds
            destination.warmUpMinutes = warmUpMinutes
            destination.warmUpHours = warmUpHours
            destination.coolDownSeconds = coolDownSeconds
            destination.coolDownMinutes = coolDownMinutes
            destination.coolDownHours = coolDownHours
            destination.numberOfIntervals = numberOfIntervals
            destination.pickUpHours = onIntervalHours
            destination.pickUpMinutes = onIntervalMinutes
            destination.pickUpSeconds = onIntervalSeconds
            destination.jogHours = jogHours
            destination.jogMinutes = jogMinutes
            destination.jogSeconds = jogSeconds
            destination.isJog = isJog
        }
        
        
        

    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if ((onIntervalHours == 0) && (onIntervalMinutes == 0) && (onIntervalSeconds == 0)){
            let alertController = UIAlertController(title: "Workout Timer", message:
                "Please specify pick up length", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            return false
            
        } else if ((jogHours == 0) && (jogMinutes == 0) && (jogSeconds == 0)){
            let alertController = UIAlertController(title: "Workout Timer", message:
                "Please specify jogging length", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            return false
            
        }
        
        return true
    }

}







