//
//  FourteenthViewController.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/20/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import Foundation
import UIKit

class FourteenthViewController: UIViewController,UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    

    

    
    @IBOutlet weak var intervalPicker: UIPickerView!
    @IBOutlet weak var secondIntervalPicker: UIPickerView!
    
    @IBOutlet weak var intervalHourPicker: UIPickerView!
    @IBOutlet weak var intervalMinutePicker: UIPickerView!
    @IBOutlet weak var intervalSecondPicker: UIPickerView!
    
    @IBOutlet weak var jogHourPicker: UIPickerView!
    @IBOutlet weak var jogMinutePicker: UIPickerView!
    @IBOutlet weak var jogSecondPicker: UIPickerView!
  
    @IBOutlet weak var intervalIncrementButton: UIButton!
    @IBOutlet weak var intervalDecrementButton: UIButton!
    
    @IBOutlet weak var restIncrementButton: UIButton!
    @IBOutlet weak var restDecrementButton: UIButton!
    
    
    @IBOutlet weak var pickUpLabel: UILabel!
    @IBOutlet weak var restLabel: UILabel!
  
    var toInterval = 1
    var fromInterval = 1
    var pickUpChangeHours = 0
    var pickUpChangeMinutes = 0
    var pickUpChangeSeconds = 0
    var restChangeHours = 0
    var restChangeMinutes = 0
    var restChangeSeconds = 0
    var mainArray = [IncrementDecrement]()
    
    
    @IBAction func saveChanges(_ sender: UIButton) {
        
        if (toInterval == fromInterval) {
            
            let alertController = UIAlertController(title: "Workout Timer", message:
                "Intervals cannot be equal", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)

        } else if (pickUpChangeHours == 0) && (pickUpChangeMinutes == 0) && (pickUpChangeSeconds == 0) && (restChangeHours == 0) && (restChangeMinutes == 0) && (restChangeSeconds == 0) {
            
            let alertController = UIAlertController(title: "Workout Timer", message:
                "Please make a change", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
        } else if (toInterval < fromInterval) {
            
            let alertController = UIAlertController(title: "Workout Timer", message:
                "Can't go back in the past! Change the interval counters", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        
            
            /*****************************************************************
             * Will eventually change this part to not be so verbosed and get
             * the new IncrementDecrement object to be passed into a function
             * that checks if there are duplicates or bad intervals, but for
             * now I just want to see if it works and Swift pass by reference
             * is different than what I'm accustom to
             *****************************************************************/
            
            
        } else if intervalIncrementIsClicked && restIncrementIsClicked {
            
            var temp = IncrementDecrement(startInterval: fromInterval, endInterval: toInterval, intervalChangeHours: pickUpChangeHours, intervalChangeMinutes: pickUpChangeMinutes, intervalChangeSeconds: pickUpChangeSeconds, restChangeHours: restChangeHours, restChangeMinutes: restChangeMinutes, restChangeSeconds: restChangeSeconds, incrementPickUp: true, decrementPickUp: false, incrementRest: true, decrementRest: false)
            
            var i = 0
            var duplicate = false
            var badIntervals = false
            while i < mainArray.count {
                if mainArray[i].isEqual(temp: temp) {
                    duplicate = true
                }
                
                if temp.intersectingIntervals(temp: mainArray[i]){
                    badIntervals = true
                }
                i = i + 1
            }
            
            NSLog("badIntervals: " + String(badIntervals))
            
            if duplicate {
                
                let alertController = UIAlertController(title: "Workout Timer", message:
                    "You've already saved these changes", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
            } else if badIntervals {
                
                let alertController = UIAlertController(title: "Workout Timer", message:
                    "Intervals intersect", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
            } else if (!duplicate) && (!badIntervals) {
                
                mainArray.append(temp)
                
                let alertController = UIAlertController(title: "Workout Timer", message:
                    "Changes saved! You may make another one", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
            }

            
        } else if intervalIncrementIsClicked && restDecrementIsClicked {
            
            var temp = IncrementDecrement(startInterval: fromInterval, endInterval: toInterval, intervalChangeHours: pickUpChangeHours, intervalChangeMinutes: pickUpChangeMinutes, intervalChangeSeconds: pickUpChangeSeconds, restChangeHours: restChangeHours, restChangeMinutes: restChangeMinutes, restChangeSeconds: restChangeSeconds, incrementPickUp: true, decrementPickUp: false, incrementRest: false, decrementRest: true)
            
            var i = 0
            var duplicate = false
            var badIntervals = false
            while i < mainArray.count {
                if mainArray[i].isEqual(temp: temp) {
                    duplicate = true
                }
                
                if temp.intersectingIntervals(temp: mainArray[i]){
                    badIntervals = true
                }
                i = i + 1
            }
            
            if duplicate {
                
                let alertController = UIAlertController(title: "Workout Timer", message:
                    "You've already saved these changes", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
            } else if badIntervals {
                
                let alertController = UIAlertController(title: "Workout Timer", message:
                    "Intervals intersect", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
            } else if (!duplicate) && (!badIntervals) {
                
                mainArray.append(temp)
                
                let alertController = UIAlertController(title: "Workout Timer", message:
                    "Changes saved! You may make another one", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
            }

            
        } else if intervalDecrementIsClicked && restDecrementIsClicked {
            
            var temp = IncrementDecrement(startInterval: fromInterval, endInterval: toInterval, intervalChangeHours: pickUpChangeHours, intervalChangeMinutes: pickUpChangeMinutes, intervalChangeSeconds: pickUpChangeSeconds, restChangeHours: restChangeHours, restChangeMinutes: restChangeMinutes, restChangeSeconds: restChangeSeconds, incrementPickUp: false, decrementPickUp: true, incrementRest: false, decrementRest: true)
            
            var i = 0
            var duplicate = false
            var badIntervals = false
            while i < mainArray.count {
                if mainArray[i].isEqual(temp: temp) {
                    duplicate = true
                }
                
                if temp.intersectingIntervals(temp: mainArray[i]){
                    badIntervals = true
                }
                i = i + 1
            }
            
            if duplicate {
                
                let alertController = UIAlertController(title: "Workout Timer", message:
                    "You've already saved these changes", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
            } else if badIntervals {
                
                let alertController = UIAlertController(title: "Workout Timer", message:
                    "Intervals intersect", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
            } else if (!duplicate) && (!badIntervals) {
                
                mainArray.append(temp)
                
                let alertController = UIAlertController(title: "Workout Timer", message:
                    "Changes saved! You may make another one", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
            }

            
        } else if intervalDecrementIsClicked && restIncrementIsClicked {
            
            var temp = IncrementDecrement(startInterval: fromInterval, endInterval: toInterval, intervalChangeHours: pickUpChangeHours, intervalChangeMinutes: pickUpChangeMinutes, intervalChangeSeconds: pickUpChangeSeconds, restChangeHours: restChangeHours, restChangeMinutes: restChangeMinutes, restChangeSeconds: restChangeSeconds, incrementPickUp: false, decrementPickUp: true, incrementRest: true, decrementRest: false)
            
            var i = 0
            var duplicate = false
            var badIntervals = false
            while i < mainArray.count {
                if mainArray[i].isEqual(temp: temp) {
                    duplicate = true
                }
                
                if temp.intersectingIntervals(temp: mainArray[i]){
                    badIntervals = true
                }
                i = i + 1
            }
            
            if duplicate {
                
                let alertController = UIAlertController(title: "Workout Timer", message:
                    "You've already saved these changes", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
            } else if badIntervals {
                
                let alertController = UIAlertController(title: "Workout Timer", message:
                    "Intervals intersect", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                
            } else if (!duplicate) && (!badIntervals) {
                
                mainArray.append(temp)
                
                let alertController = UIAlertController(title: "Workout Timer", message:
                    "Changes saved! You may make another one", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        var j = 0
        while j < mainArray.count {
            mainArray[j].toString()
            j = j + 1
        }
    }
    
    
    @IBAction func intervalIncrement(_ sender: UIButton) {
        
        if intervalIncrementIsClicked {
            intervalIncrementIsClicked = false
            intervalIncrementButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            intervalDecrementButton.backgroundColor = UIColor(red: 13/255, green: 143/255, blue: 0/255, alpha: 1)
            
        } else {
            intervalIncrementIsClicked = true
            intervalDecrementIsClicked = false
            intervalIncrementButton.backgroundColor = UIColor.red
            intervalDecrementButton.backgroundColor = UIColor.gray
        }
    }
    
    
    @IBAction func intervalDecrement(_ sender: UIButton) {
        
        if intervalDecrementIsClicked {
            intervalDecrementIsClicked = false
            intervalDecrementButton.backgroundColor = UIColor(red: 13/255, green: 143/255, blue: 0/255, alpha: 1)
            intervalIncrementButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            
        } else {
            intervalDecrementIsClicked = true
            intervalIncrementIsClicked = false
            intervalDecrementButton.backgroundColor = UIColor.red
            intervalIncrementButton.backgroundColor = UIColor.gray
        }
    }
    
    
    @IBAction func restIncrement(_ sender: UIButton) {
        
        if restIncrementIsClicked {
            restIncrementIsClicked = false
            restIncrementButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            restDecrementButton.backgroundColor = UIColor(red: 13/255, green: 143/255, blue: 0/255, alpha: 1)
            
        } else {
            restIncrementIsClicked = true
            restDecrementIsClicked = false
            restIncrementButton.backgroundColor = UIColor.red
            restDecrementButton.backgroundColor = UIColor.gray
        }
    }
    
    
    @IBAction func restDecrement(_ sender: UIButton) {
        
        if restDecrementIsClicked {
            restDecrementIsClicked = false
            restDecrementButton.backgroundColor = UIColor(red: 13/255, green: 143/255, blue: 0/255, alpha: 1)
            restIncrementButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            
        } else {
            restDecrementIsClicked = true
            restIncrementIsClicked = false
            restDecrementButton.backgroundColor = UIColor.red
            restIncrementButton.backgroundColor = UIColor.gray
        }
    }
    
    
    
    
    
    
    var usersName = String()
    var warmUpSeconds = Int()
    var warmUpMinutes = Int()
    var warmUpHours = Int()
    var coolDownSeconds = Int()
    var coolDownMinutes = Int()
    var coolDownHours = Int()
    var numberOfIntervals = Int()
    var pickUpHours = Int()
    var pickUpMinutes = Int()
    var pickUpSeconds = Int()
    var jogHours = Int()
    var jogMinutes = Int()
    var jogSeconds = Int()
    var isJog = Bool()
    
    
    
    var intervalIncrementIsClicked = false
    var intervalDecrementIsClicked = false
    
    var restIncrementIsClicked = false
    var restDecrementIsClicked = false
    
    
    var intervalPickerData = [String](repeating: "", count: 51)
    var secondIntervalPickerData = [String](repeating: "", count: 51)
    
    var onIntervalHourPickerData = [String](repeating: "", count: 6)
    var onIntervalMinutePickerData = [String](repeating: "", count: 60)
    var onIntervalSecondPickerData = [String](repeating: "", count: 60)
    
    var jogHourPickerData = [String](repeating: "", count: 6)
    var jogMinutePickerData = [String](repeating: "", count: 60)
    var jogSecondPickerData = [String](repeating: "", count: 60)
    
    
    override func viewDidLoad() {
        NSLog("PICK UP SECONDS: " + String(pickUpSeconds))
        
        
        NSLog("in class")
        super.viewDidLoad()
        
        var intervalPickerDataSecond = [String](repeating: "", count: numberOfIntervals)
        intervalPickerData = intervalPickerDataSecond
        secondIntervalPickerData = intervalPickerDataSecond
        
        if (!isJog) {
            pickUpLabel.text = "Interval\nlength\nchange:"
            restLabel.text = "Rest\nlength\nchange:"
        }
        
        self.intervalPicker.delegate = self
        self.secondIntervalPicker.delegate = self
        
        self.intervalHourPicker.delegate = self
        self.intervalMinutePicker.delegate = self
        self.intervalSecondPicker.delegate = self
        
        self.jogHourPicker.delegate = self
        self.jogMinutePicker.delegate = self
        self.jogSecondPicker.delegate = self
        
        
        var seconds = 1
        while seconds < numberOfIntervals + 1 {
            if seconds < 10 {
                intervalPickerData[seconds-1] = "0" + String(seconds)
                secondIntervalPickerData[seconds-1] = "0" + String(seconds)
            } else {
                intervalPickerData[seconds-1] = String(seconds)
                secondIntervalPickerData[seconds-1] = String(seconds)
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
            
        } else if pickerView == secondIntervalPicker {
            return secondIntervalPickerData.count
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
            
        } else if pickerView == secondIntervalPicker {
            return secondIntervalPickerData[row]
        }
        
        return nil
    }
    
    
    
    // Capture the picker view selection
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        if pickerView.tag == 1 {
            fromInterval = row+1;
            NSLog("Lower Bound Interval: " + String(fromInterval));
            
        } else if pickerView.tag == 2 {
            pickUpChangeHours = row
            NSLog("Pick up hours: " + String(pickUpChangeHours))
            
        } else if pickerView.tag == 3 {
            pickUpChangeMinutes = row
            NSLog("Pick up minutes: " + String(pickUpChangeMinutes))
            
        } else if pickerView.tag == 4 {
            pickUpChangeSeconds = row
            NSLog("Pick up seconds: " + String(pickUpChangeSeconds))
            
        } else if pickerView.tag == 5 {
            restChangeHours = row
            NSLog("Jogging hours: " + String(restChangeHours))
            
        } else if pickerView.tag == 6 {
            restChangeMinutes = row
            NSLog("Jogging minutes: " + String(restChangeMinutes))
            
        } else if pickerView.tag == 7 {
            restChangeSeconds = row
            NSLog("Jogging seconds: " + String(restChangeSeconds))
            
        } else if pickerView.tag == 8 {
            toInterval = row+1
            NSLog("Upper Bound Interval: " + String(toInterval))
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination : FifteenthViewController = segue.destination as! FifteenthViewController
        NSLog("in segue")
        destination.usersName = String(usersName)
        destination.warmUpSeconds = warmUpSeconds
        destination.warmUpMinutes = warmUpMinutes
        destination.warmUpHours = warmUpHours
        destination.coolDownSeconds = coolDownSeconds
        destination.coolDownMinutes = coolDownMinutes
        destination.coolDownHours = coolDownHours
        destination.numberOfIntervals = numberOfIntervals
        destination.pickUpHours = pickUpHours
        destination.pickUpMinutes = pickUpMinutes
        destination.pickUpSeconds = pickUpSeconds
        destination.jogHours = jogHours
        destination.jogMinutes = jogMinutes
        destination.jogSeconds = jogSeconds
        destination.isJog = isJog
        destination.mainArray = mainArray
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if (mainArray.count == 0){
            let alertController = UIAlertController(title: "Workout Timer", message:
                "Please select an option", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            return false
            
        }
        
        return true
    }
    
}

