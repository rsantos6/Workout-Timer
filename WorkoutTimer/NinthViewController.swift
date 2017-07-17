//
//  NinthViewController.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/17/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import Foundation
import UIKit

class NinthViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var warmUpInfo: UILabel!
    @IBOutlet weak var coolDownInfo: UILabel!
    @IBOutlet weak var runInfo: UILabel!
    
    
    @IBAction func editWarmUpButton(_ sender: UIButton) {
        editWarmUp = true
    }
    
    @IBAction func editCoolDownButton(_ sender: UIButton) {
        editCoolDown = true
    }
    
    @IBAction func editRun(_ sender: UIButton) {
        editRun = true
    }
    
    @IBAction func startRunButton(_ sender: UIButton) {
        startRun = true
    }
    
   /* @IBAction func unwindToNinthViewController(segue: UIStoryboardSegue){
        
    }*/
    
    
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
    
    var stringWarmUpHours = ""
    var stringWarmUpMinutes = ""
    var stringWarmUpSeconds = ""
    var stringCoolDownHours = ""
    var stringCoolDownMinutes = ""
    var stringCoolDownSeconds = ""
    var stringRunHours = ""
    var stringRunMinutes = ""
    var stringRunSeconds = ""
    
    var editWarmUp = false
    var editCoolDown = false
    var editRun = false
    var startRun = false
    
    override func viewDidLoad() {
        NSLog("in class")
        super.viewDidLoad()
        if warmUpHours > 0 {
            if warmUpHours == 1 {
                stringWarmUpHours = String(warmUpHours) + " hour"
            } else {
                stringWarmUpHours = String(warmUpHours) + " hours"
            }
            
        }
        if warmUpMinutes > 0 {
            if warmUpMinutes == 1 {
                stringWarmUpMinutes = String(warmUpMinutes) + " minute"
            } else {
                stringWarmUpMinutes = String(warmUpMinutes) + " minutes"
            }
            
        }
        if warmUpSeconds > 0 {
            if warmUpSeconds == 1 {
                stringWarmUpSeconds = String(warmUpSeconds) + " second"
            } else {
                stringWarmUpSeconds = String(warmUpSeconds) + " seconds"
            }
           
        }
        
        var boldText = "Warmup Time: \n"
        var attrs = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)]
        var attributedString = NSMutableAttributedString(string:boldText, attributes: attrs)
        
        NSLog("Warmup Hours: " + stringWarmUpHours);
        NSLog("Warmup Minutes: " + stringWarmUpMinutes);
        NSLog("Warmup Seconds: " + stringWarmUpSeconds);

        
        /*if the user is doing a warmup that involves hours, minutes and seconds*/
        if (stringWarmUpHours != "") && (stringWarmUpMinutes != "") && (stringWarmUpSeconds != "") {
            
            var warmUpText = stringWarmUpHours + ", " + stringWarmUpMinutes + ", and " + stringWarmUpSeconds
            var normalText = NSMutableAttributedString(string:warmUpText)
            attributedString.append(normalText)
            warmUpInfo.attributedText = attributedString
            
        }
        
        /* these are the conditions if one of the hours, minutes,
             or seconds are empty*/
        else if (stringWarmUpHours == "") && (stringWarmUpMinutes != "") && (stringWarmUpSeconds != ""){
            
            var warmUpText = stringWarmUpMinutes + ", and " + stringWarmUpSeconds
            var normalText = NSMutableAttributedString(string:warmUpText)
            attributedString.append(normalText)
            warmUpInfo.attributedText = attributedString
            
            
        } else if (stringWarmUpHours != "") && (stringWarmUpMinutes == "") && (stringWarmUpSeconds != ""){
            
            var warmUpText = stringWarmUpHours + ", and " + stringWarmUpSeconds
            var normalText = NSMutableAttributedString(string:warmUpText)
            attributedString.append(normalText)
            warmUpInfo.attributedText = attributedString
            
        } else if (stringWarmUpHours != "") && (stringWarmUpMinutes != "") && (stringWarmUpSeconds == ""){
            
            var warmUpText = stringWarmUpHours + ", and " + stringWarmUpMinutes
            var normalText = NSMutableAttributedString(string:warmUpText)
            attributedString.append(normalText)
            warmUpInfo.attributedText = attributedString
        }
        
            
        /*these are the conditions if two of the conditions, hours, minutes,
             or seconds are empty */
        else if (stringWarmUpHours == "") && (stringWarmUpMinutes == "") && (stringWarmUpSeconds != ""){
            
            var warmUpText = stringWarmUpSeconds
            var normalText = NSMutableAttributedString(string:warmUpText)
            attributedString.append(normalText)
            warmUpInfo.attributedText = attributedString
            
        } else if (stringWarmUpHours != "") && (stringWarmUpMinutes == "") && (stringWarmUpSeconds == ""){

            var warmUpText = stringWarmUpHours
            var normalText = NSMutableAttributedString(string:warmUpText)
            attributedString.append(normalText)
             warmUpInfo.attributedText = attributedString
            
        } else if (stringWarmUpHours == "") && (stringWarmUpMinutes != "") && (stringWarmUpSeconds == ""){
            
            var warmUpText = stringWarmUpMinutes
            var normalText = NSMutableAttributedString(string:warmUpText)
            attributedString.append(normalText)
            warmUpInfo.attributedText = attributedString
            
        }
        
            /*if the user is not doingn a warmup */
        else {
        
            var warmUpText = "None"
            var normalText = NSMutableAttributedString(string:warmUpText)
            attributedString.append(normalText)
            warmUpInfo.attributedText = attributedString
        }
        
        
        
        
        if coolDownHours > 0 {
            if coolDownHours == 1 {
                stringCoolDownHours = String(coolDownHours) + " hour"
            } else {
                stringCoolDownHours = String(coolDownHours) + " hours"
            }
            
        }
        if coolDownMinutes > 0 {
            if coolDownMinutes == 1 {
                stringCoolDownMinutes = String(coolDownMinutes) + " minute"
            } else {
                stringCoolDownMinutes = String(coolDownMinutes) + " minutes"
            }
            
        }
        if coolDownSeconds > 0 {
            if coolDownSeconds == 1 {
                stringCoolDownSeconds = String(coolDownSeconds) + " second"
            } else {
                stringCoolDownSeconds = String(coolDownSeconds) + " seconds"
            }
            
        }
        
        boldText = "Cooldown Time: \n"
        attrs = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)]
        attributedString = NSMutableAttributedString(string:boldText, attributes: attrs)
        
        NSLog("Cooldown Hours: " + stringCoolDownHours);
        NSLog("Cooldown Minutes: " + stringCoolDownMinutes);
        NSLog("Cooldown Seconds: " + stringCoolDownSeconds);
        
        /*if the user is doing a warmup that involves hours, minutes and seconds*/
        if (stringCoolDownHours != "") && (stringCoolDownMinutes != "") && (stringCoolDownSeconds != "") {
            
            var coolDownText = stringCoolDownHours + ", " + stringCoolDownMinutes + ", and " + stringCoolDownSeconds
            var normalText = NSMutableAttributedString(string:coolDownText)
            attributedString.append(normalText)
            coolDownInfo.attributedText = attributedString
            
        }
            
            /* these are the conditions if one of the hours, minutes,
             or seconds are empty*/
        else if (stringCoolDownHours == "") && (stringCoolDownMinutes != "") && (stringCoolDownSeconds != ""){
            
            var coolDownText = stringCoolDownMinutes + ", and " + stringCoolDownSeconds
            var normalText = NSMutableAttributedString(string:coolDownText)
            attributedString.append(normalText)
            coolDownInfo.attributedText = attributedString
            
            
        } else if (stringCoolDownHours != "") && (stringCoolDownMinutes == "") && (stringCoolDownSeconds != ""){
            
            var coolDownText = stringCoolDownHours + ", and " + stringCoolDownSeconds
            var normalText = NSMutableAttributedString(string:coolDownText)
            attributedString.append(normalText)
            coolDownInfo.attributedText = attributedString
            
        } else if (stringCoolDownHours != "") && (stringCoolDownMinutes != "") && (stringCoolDownSeconds == ""){
            
            var coolDownText = stringCoolDownHours + ", and " + stringCoolDownMinutes
            var normalText = NSMutableAttributedString(string:coolDownText)
            attributedString.append(normalText)
            coolDownInfo.attributedText = attributedString
        }
            
            
            /*these are the conditions if two of the conditions, hours, minutes,
             or seconds are empty */
        else if (stringCoolDownHours == "") && (stringCoolDownMinutes == "") && (stringCoolDownSeconds != ""){
            
            var coolDownText = stringCoolDownSeconds
            var normalText = NSMutableAttributedString(string:coolDownText)
            attributedString.append(normalText)
            coolDownInfo.attributedText = attributedString
            
        } else if (stringCoolDownHours != "") && (stringCoolDownMinutes == "") && (stringCoolDownSeconds == ""){
            
            var coolDownText = stringCoolDownHours
            var normalText = NSMutableAttributedString(string:coolDownText)
            attributedString.append(normalText)
            coolDownInfo.attributedText = attributedString
            
        } else if (stringCoolDownHours == "") && (stringCoolDownMinutes != "") && (stringCoolDownSeconds == ""){
            
            var coolDownText = stringCoolDownMinutes
            var normalText = NSMutableAttributedString(string:coolDownText)
            attributedString.append(normalText)
            coolDownInfo.attributedText = attributedString
            
        }
            
            /*if the user is not doingn a warmup */
        else {
            
            var coolDownText = "None"
            var normalText = NSMutableAttributedString(string:coolDownText)
            attributedString.append(normalText)
            coolDownInfo.attributedText = attributedString
        }
        
        
        
        
        
        
        
        if fullRunHours > 0 {
            if fullRunHours == 1 {
                stringRunHours = String(fullRunHours) + " hour"
            } else {
                stringRunHours = String(fullRunHours) + " hours"
            }
            
        }
        if fullRunMinutes > 0 {
            if fullRunMinutes == 1 {
                stringRunMinutes = String(fullRunMinutes) + " minute"
            } else {
                stringRunMinutes = String(fullRunMinutes) + " minutes"
            }
            
        }
        if fullRunSeconds > 0 {
            if fullRunSeconds == 1 {
                stringRunSeconds = String(fullRunSeconds) + " second"
            } else {
                stringRunSeconds = String(fullRunSeconds) + " seconds"
            }
            
        }
        
        boldText = "Run Time: \n"
        attrs = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)]
        attributedString = NSMutableAttributedString(string:boldText, attributes: attrs)
        
        NSLog("Run Hours: " + stringRunHours);
        NSLog("Run Minutes: " + stringRunMinutes);
        NSLog("Run Seconds: " + stringRunSeconds);
        
        /*if the user is doing a warmup that involves hours, minutes and seconds*/
        if (stringRunHours != "") && (stringRunMinutes != "") && (stringRunSeconds != "") {
            
            var coolDownText = stringRunHours + ", " + stringRunMinutes + ", and " + stringRunSeconds
            var normalText = NSMutableAttributedString(string:coolDownText)
            attributedString.append(normalText)
            runInfo.attributedText = attributedString
            
        }
            
            /* these are the conditions if one of the hours, minutes,
             or seconds are empty*/
        else if (stringRunHours == "") && (stringRunMinutes != "") && (stringRunSeconds != ""){
            
            var fullRunText = stringRunMinutes + ", and " + stringRunSeconds
            var normalText = NSMutableAttributedString(string:fullRunText)
            attributedString.append(normalText)
            runInfo.attributedText = attributedString
            
            
        } else if (stringRunHours != "") && (stringRunMinutes == "") && (stringRunSeconds != ""){
            
            var fullRunText = stringRunHours + ", and " + stringRunSeconds
            var normalText = NSMutableAttributedString(string:fullRunText)
            attributedString.append(normalText)
            runInfo.attributedText = attributedString
            
        } else if (stringRunHours != "") && (stringRunMinutes != "") && (stringRunSeconds == ""){
            
            var fullRunText = stringRunHours + ", and " + stringRunMinutes
            var normalText = NSMutableAttributedString(string:fullRunText)
            attributedString.append(normalText)
            runInfo.attributedText = attributedString
        }
            
            
            /*these are the conditions if two of the conditions, hours, minutes,
             or seconds are empty */
        else if (stringRunHours == "") && (stringRunMinutes == "") && (stringRunSeconds != ""){
            
            var fullRunText = stringRunSeconds
            var normalText = NSMutableAttributedString(string:fullRunText)
            attributedString.append(normalText)
            runInfo.attributedText = attributedString
            
        } else if (stringRunHours != "") && (stringRunMinutes == "") && (stringRunSeconds == ""){
            
            var fullRunText = stringRunHours
            var normalText = NSMutableAttributedString(string:fullRunText)
            attributedString.append(normalText)
            runInfo.attributedText = attributedString
            
        } else if (stringRunHours == "") && (stringRunMinutes != "") && (stringRunSeconds == ""){
            
            var fullRunText = stringRunMinutes
            var normalText = NSMutableAttributedString(string:fullRunText)
            attributedString.append(normalText)
            runInfo.attributedText = attributedString
            
        }
            
            /*if the user is not doingn a warmup */
        else {
            
            var fullRunText = "None"
            var normalText = NSMutableAttributedString(string:fullRunText)
            attributedString.append(normalText)
            runInfo.attributedText = attributedString
        }


       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if editRun {
            let destination : TenthViewController = segue.destination as! TenthViewController
            NSLog("in segue")
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
            destination.whatEdit = "run"
        } else if editCoolDown {
            let destination : TenthViewController = segue.destination as! TenthViewController
            NSLog("in segue")
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
            destination.whatEdit = "cooldown"
        } else if editWarmUp {
            let destination : TenthViewController = segue.destination as! TenthViewController
            NSLog("in segue")
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
            destination.whatEdit = "warmup"
        } else {
            let destination : EleventhViewController = segue.destination as! EleventhViewController
            NSLog("in segue")
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
    
    
    
}

