//
//  FifteenthViewController.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/21/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import Foundation
import UIKit

class FifteenthViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var warmUpInfo: UILabel!
   
    @IBOutlet weak var coolDownInfo: UILabel!
    
    @IBAction func editWarmUpButton(_ sender: UIButton) {
        editWarmUp = true
    }
    
    @IBAction func editCoolDownButton(_ sender: UIButton) {
        editCoolDown = true
    }
    
    @IBOutlet weak var numberOfIntervalsLabel: UILabel!
    
    @IBOutlet weak var pickUpLengthLabel: UILabel!
    
    @IBOutlet weak var restLengthLabel: UILabel!
    
    @IBAction func toEditButton(_ sender: UIButton) {
        toEdit = true
    }
    
    @IBAction func toRunButton(_ sender: UIButton) {
        toRun = true
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
    var mainArray = [IncrementDecrement]()
    
    var toEdit = false
    var toRun = false
    
    var boldText = ""
    
    var stringWarmUpHours = ""
    var stringWarmUpMinutes = ""
    var stringWarmUpSeconds = ""
    var stringCoolDownHours = ""
    var stringCoolDownMinutes = ""
    var stringCoolDownSeconds = ""
    var stringPickUpHours = ""
    var stringPickUpMinutes = ""
    var stringPickUpSeconds = ""
    var stringRestHours = ""
    var stringRestMinutes = ""
    var stringRestSeconds = ""

    var editWarmUp = false
    var editCoolDown = false

    
    override func viewDidLoad() {
 
        super.viewDidLoad()
        
        var g = 0
        while g < mainArray.count {
            mainArray[g].toString()
            g = g + 1
        }
        
        var bText = "Number Of Intervals: "
        var atrs = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)]
        var atributedString = NSMutableAttributedString(string:bText, attributes: atrs)
        
        var iText = String(numberOfIntervals)
        var nText = NSMutableAttributedString(string:iText)
        atributedString.append(nText)
        numberOfIntervalsLabel.attributedText = atributedString
        
        
        
        /**********************************************************/
        
        
        
        
        if pickUpHours > 0 {
            if pickUpHours == 1 {
                stringPickUpHours = String(pickUpHours) + " hour"
            } else {
                stringPickUpHours = String(pickUpHours) + " hours"
            }
            
        }
        if pickUpMinutes > 0 {
            if pickUpMinutes == 1 {
                stringPickUpMinutes = String(pickUpMinutes) + " minute"
            } else {
                stringPickUpMinutes = String(pickUpMinutes) + " minutes"
            }
            
        }
        if pickUpSeconds > 0 {
            if pickUpSeconds == 1 {
                stringPickUpSeconds = String(pickUpSeconds) + " second"
            } else {
                stringPickUpSeconds = String(pickUpSeconds) + " seconds"
            }
            
        }
        
        
        if (isJog) {
            boldText = "Pick Up Length: \n"
        } else {
            boldText = "Interval Length: \n"
        }

        var attrs = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)]
        var attributedString = NSMutableAttributedString(string:boldText, attributes: attrs)
        
        
        
        /*if the user is doing a warmup that involves hours, minutes and seconds*/
        if (stringPickUpHours != "") && (stringPickUpMinutes != "") && (stringPickUpSeconds != "") {
            
            var pickUpText = stringPickUpHours + ", " + stringPickUpMinutes + ", and " + stringPickUpSeconds
            var normalText = NSMutableAttributedString(string:pickUpText)
            attributedString.append(normalText)
            pickUpLengthLabel.attributedText = attributedString
            
        }
            
            /* these are the conditions if one of the hours, minutes,
             or seconds are empty*/
        else if (stringPickUpHours == "") && (stringPickUpMinutes != "") && (stringPickUpSeconds != ""){
            
            var pickUpText = stringPickUpMinutes + ", and " + stringPickUpSeconds
            var normalText = NSMutableAttributedString(string:pickUpText)
            attributedString.append(normalText)
            pickUpLengthLabel.attributedText = attributedString
            
            
        } else if (stringPickUpHours != "") && (stringPickUpMinutes == "") && (stringPickUpSeconds != ""){
            
            var pickUpText = stringPickUpHours + ", and " + stringPickUpSeconds
            var normalText = NSMutableAttributedString(string:pickUpText)
            attributedString.append(normalText)
            pickUpLengthLabel.attributedText = attributedString
            
        } else if (stringPickUpHours != "") && (stringPickUpMinutes != "") && (stringPickUpSeconds == ""){
            
            var pickUpText = stringPickUpHours + ", and " + stringPickUpMinutes
            var normalText = NSMutableAttributedString(string:pickUpText)
            attributedString.append(normalText)
            pickUpLengthLabel.attributedText = attributedString
        }
            
            
            /*these are the conditions if two of the conditions, hours, minutes,
             or seconds are empty */
        else if (stringPickUpHours == "") && (stringPickUpMinutes == "") && (stringPickUpSeconds != ""){
            
            var pickUpText = stringPickUpSeconds
            var normalText = NSMutableAttributedString(string:pickUpText)
            attributedString.append(normalText)
            pickUpLengthLabel.attributedText = attributedString
            
        } else if (stringPickUpHours != "") && (stringPickUpMinutes == "") && (stringPickUpSeconds == ""){
            
            var pickUpText = stringPickUpHours
            var normalText = NSMutableAttributedString(string:pickUpText)
            attributedString.append(normalText)
            pickUpLengthLabel.attributedText = attributedString
            
        } else if (stringPickUpHours == "") && (stringPickUpMinutes != "") && (stringPickUpSeconds == ""){
            
            var pickUpText = stringPickUpMinutes
            var normalText = NSMutableAttributedString(string:pickUpText)
            attributedString.append(normalText)
            pickUpLengthLabel.attributedText = attributedString
            
        }
            
            /*if the user is not doingn a warmup */
        else {
            
            var pickUpText = "None"
            var normalText = NSMutableAttributedString(string:pickUpText)
            attributedString.append(normalText)
            pickUpLengthLabel.attributedText = attributedString
        }

        /********************************************************/
        
        
        
        
        /**********************************************************/
        
        
        
        
        if jogHours > 0 {
            if jogHours == 1 {
                stringRestHours = String(jogHours) + " hour"
            } else {
                stringRestHours = String(jogHours) + " hours"
            }
            
        }
        if jogMinutes > 0 {
            if jogMinutes == 1 {
                stringRestMinutes = String(jogMinutes) + " minute"
            } else {
                stringRestMinutes = String(jogMinutes) + " minutes"
            }
            
        }
        if jogSeconds > 0 {
            if jogSeconds == 1 {
                stringRestSeconds = String(jogSeconds) + " second"
            } else {
                stringRestSeconds = String(jogSeconds) + " seconds"
            }
            
        }
        if (isJog) {
            boldText = "Jogging Length: \n"
        } else {
            boldText = "Rest Length: \n"
        }
        
        attrs = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)]
        attributedString = NSMutableAttributedString(string:boldText, attributes: attrs)
        
        
        
        /*if the user is doing a warmup that involves hours, minutes and seconds*/
        if (stringRestHours != "") && (stringRestMinutes != "") && (stringRestSeconds != "") {
            
            var restText = stringRestHours + ", " + stringRestMinutes + ", and " + stringRestSeconds
            var normalText = NSMutableAttributedString(string:restText)
            attributedString.append(normalText)
            restLengthLabel.attributedText = attributedString
            
        }
            
            /* these are the conditions if one of the hours, minutes,
             or seconds are empty*/
        else if (stringRestHours == "") && (stringRestMinutes != "") && (stringRestSeconds != ""){
            
            var restText = stringRestMinutes + ", and " + stringRestSeconds
            var normalText = NSMutableAttributedString(string:restText)
            attributedString.append(normalText)
            restLengthLabel.attributedText = attributedString
            
            
        } else if (stringRestHours != "") && (stringRestMinutes == "") && (stringRestSeconds != ""){
            
            var restText = stringRestHours + ", and " + stringRestSeconds
            var normalText = NSMutableAttributedString(string:restText)
            attributedString.append(normalText)
            restLengthLabel.attributedText = attributedString
            
        } else if (stringRestHours != "") && (stringRestMinutes != "") && (stringRestSeconds == ""){
            
            var restText = stringRestHours + ", and " + stringRestMinutes
            var normalText = NSMutableAttributedString(string:restText)
            attributedString.append(normalText)
            restLengthLabel.attributedText = attributedString
        }
            
            
            /*these are the conditions if two of the conditions, hours, minutes,
             or seconds are empty */
        else if (stringRestHours == "") && (stringRestMinutes == "") && (stringRestSeconds != ""){
            
            var restText = stringRestSeconds
            var normalText = NSMutableAttributedString(string:restText)
            attributedString.append(normalText)
            restLengthLabel.attributedText = attributedString
            
        } else if (stringRestHours != "") && (stringRestMinutes == "") && (stringRestSeconds == ""){
            
            var restText = stringRestHours
            var normalText = NSMutableAttributedString(string:restText)
            attributedString.append(normalText)
            restLengthLabel.attributedText = attributedString
            
        } else if (stringRestHours == "") && (stringRestMinutes != "") && (stringRestSeconds == ""){
            
            var restText = stringRestMinutes
            var normalText = NSMutableAttributedString(string:restText)
            attributedString.append(normalText)
            restLengthLabel.attributedText = attributedString
            
        }
            
            /*if the user is not doingn a warmup */
        else {
            
            var restText = "None"
            var normalText = NSMutableAttributedString(string:restText)
            attributedString.append(normalText)
            restLengthLabel.attributedText = attributedString
        }
        
        /********************************************************/

        
       
        
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
        
        boldText = "Warmup Time: \n"
        attrs = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 17)]
        attributedString = NSMutableAttributedString(string:boldText, attributes: attrs)
        
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


        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         if editCoolDown {
            let destination : TenthViewController = segue.destination as! TenthViewController
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
            destination.whatEdit = "cooldown"
            destination.fromFifteen = true
            
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
            destination.numberOfIntervals = numberOfIntervals
            destination.pickUpHours = pickUpHours
            destination.pickUpMinutes = pickUpMinutes
            destination.pickUpSeconds = pickUpSeconds
            destination.jogHours = jogHours
            destination.jogMinutes = jogMinutes
            destination.jogSeconds = jogSeconds
            destination.isJog = isJog
            destination.mainArray = mainArray
            destination.whatEdit = "warmup"
            destination.fromFifteen = true
            
            
        } else if toEdit {
            let destination : SeventhViewController = segue.destination as! SeventhViewController
            NSLog("in segue")
            destination.usersName = String(usersName)
            destination.warmUpSeconds = warmUpSeconds
            destination.warmUpMinutes = warmUpMinutes
            destination.warmUpHours = warmUpHours
            destination.coolDownSeconds = coolDownSeconds
            destination.coolDownMinutes = coolDownMinutes
            destination.coolDownHours = coolDownHours
            destination.isJog = isJog
            
         } else if toRun {
            let destination : SixteenthViewController = segue.destination as! SixteenthViewController
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

        }
    }
}


