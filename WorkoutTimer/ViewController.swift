//
//  ViewController.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/11/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var secondPicker: UIPickerView!
    @IBOutlet weak var thirdPicker: UIPickerView!
    @IBOutlet weak var toggleInstuction: UILabel!
    @IBOutlet weak var warmUpQ: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var yesButtonReal: UIButton!
    @IBOutlet weak var noButtonReal: UIButton!
    @IBOutlet weak var continueButtonReal: UIButton!
    
    
    
        
    @IBAction func continueBUttonTapped(_ sender: Any) {
        
        NSLog("continue tapped");
    }
        
    
    
    /* 
     * This section below reveals the picker options if the
     * user clicks yes they do want to do a warmup
     */
    @IBAction func yesButton(_ sender: Any) {
        warmUpQ.isHidden = false
        picker.isHidden = false
        secondPicker.isHidden = false
        thirdPicker.isHidden = false
        hourLabel.isHidden = false
        minLabel.isHidden = false
        secLabel.isHidden = false
        yesButtonReal.isHidden = true
        toggleInstuction.isHidden = true
        noButtonReal.isHidden = true
        continueButtonReal.isHidden = false
        
    }
    
    
    var pickerData = [String](repeating: "", count: 60)
    var secondPickerData = [String](repeating: "", count: 60)
    var thirdPickerData = [String](repeating: "", count: 6)
    var usersName = String();
    var warmupSeconds = 0
    var warmupMinutes = 0
    var warmupHours = 0
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        warmUpQ.isHidden = true
        picker.isHidden = true
        secondPicker.isHidden = true
        thirdPicker.isHidden = true
        hourLabel.isHidden = true
        minLabel.isHidden = true
        secLabel.isHidden = true
        continueButtonReal.isHidden = true
        
        
        
        if usersName != "" {
            toggleInstuction.text = "Welcome "+usersName+"! Are you doing a warmup?"
        } else {
            toggleInstuction.text = "Welcome! Are you planning on doing a warmup?"
        }
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        self.secondPicker.delegate = self
        self.secondPicker.dataSource = self
        
        self.thirdPicker.delegate = self
        self.thirdPicker.dataSource = self
        
        
        
        
        
        
        var seconds = 0
        while seconds < 60 {
            if seconds < 10 {
                secondPickerData[seconds] = "0" + String(seconds)
                pickerData[seconds] = "0" + String(seconds)
            } else {
                secondPickerData[seconds] = String(seconds)
                pickerData[seconds] = String(seconds)
            }
            seconds += 1
        }
        
        var sec = 0
        while sec < 6 {
            thirdPickerData[sec] = "0" + String(sec)
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
        if pickerView == picker {
            return pickerData.count
        } else if pickerView == secondPicker {
            return secondPickerData.count
        } else {
            return thirdPickerData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == picker {
            return pickerData[row]
        } else if pickerView == secondPicker {
            return secondPickerData[row]
        } else {
            return thirdPickerData[row]
        }
    }
    
    
    
    // Capture the picker view selection
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        if (pickerView.tag == 3){
            warmupSeconds = row;
            NSLog("Warmup Second Picker Change: " + String(row));
        } else if (pickerView.tag == 2){
            warmupMinutes = row;
            NSLog("Warmup Minute Picker Change: " + String(row));
        } else {
            warmupHours = row
            NSLog("Warmup Hour Picker Change: " + String(row));
        }
        
    }
    
    
    /*
     * This section below prepares for the transition to the next 
     * controller, setting the "future" variable's value to the users name
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination : ThirdViewController = segue.destination as! ThirdViewController
        destination.usersName = String(usersName)
        destination.warmUpSeconds = warmupSeconds
        destination.warmUpMinutes = warmupMinutes
        destination.warmUpHours = warmupHours
    }

}
















