//
//  FifthViewController.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/14/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//
import Foundation
import UIKit

class FifthViewController: UIViewController  {
    
    @IBOutlet weak var multipleQuestionLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var yesButton2: UIButton!
    @IBOutlet weak var yesButton3: UIButton!
    
    
    
    
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        if questionCount == 2 {
            questionCount -= 1
            multipleQuestionLabel.text = "Are you running without any rest/jogging period?"
            backButton.isHidden = true
        } else if questionCount == 3{
            questionCount -= 1
            multipleQuestionLabel.text = "Are you running with jogging intervals?"
        }
    }
    
    
    @IBAction func noButtonAction(_ sender: UIButton) {
        backButton.isHidden = false
        questionCount += 1
        if questionCount == 2 {
            yesButton.isHidden = true
            yesButton3.isHidden = true
            yesButton2.isHidden = false
            multipleQuestionLabel.text = "Are you running with jogging intervals?"
        } else if questionCount == 3 {
            multipleQuestionLabel.text = "Are you running with complete rest periods?"
            yesButton.isHidden = true
            yesButton2.isHidden = true
            yesButton3.isHidden = false
        } else {
            multipleQuestionLabel.text = "Please select one of the previous options"
            multipleQuestionLabel.textColor = UIColor.white
            let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
            DispatchQueue.main.asyncAfter(deadline: when) {
                // code with delay
                self.multipleQuestionLabel.text = "Are you running without any rest/jogging period?"
                self.multipleQuestionLabel.textColor = UIColor.black
                self.questionCount = 1
                self.backButton.isHidden = true
                self.yesButton.isHidden = false
                self.yesButton2.isHidden = true
                self.yesButton3.isHidden = true
            }
        }
    }
    
 
    
    
    
    
    
    var usersName = String()
    var warmUpSeconds = Int()
    var warmUpMinutes = Int()
    var warmUpHours = Int()
    var coolDownSeconds = Int()
    var coolDownMinutes = Int()
    var coolDownHours = Int()
    var questionCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        multipleQuestionLabel.text = "Are you running without any rest/jogging period?"
        backButton.isHidden = true
        yesButton2.isHidden = true
        yesButton3.isHidden = true
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*This one is if the user is running without any rest/jogging period
        aka just going for a straight run*/
        if questionCount == 1 {
           let destination : SixthViewController = segue.destination as! SixthViewController
            
            destination.usersName = String(usersName)
            destination.warmUpSeconds = warmUpSeconds
            destination.warmUpMinutes = warmUpMinutes
            destination.warmUpHours = warmUpHours
            destination.coolDownSeconds = coolDownSeconds
            destination.coolDownMinutes = coolDownMinutes
            destination.coolDownHours = coolDownHours
            NSLog("Going to SixthViewController")
            
        } else if questionCount == 2{
            let destination : SeventhViewController = segue.destination as! SeventhViewController
            
            destination.usersName = String(usersName)
            destination.warmUpSeconds = warmUpSeconds
            destination.warmUpMinutes = warmUpMinutes
            destination.warmUpHours = warmUpHours
            destination.coolDownSeconds = coolDownSeconds
            destination.coolDownMinutes = coolDownMinutes
            destination.coolDownHours = coolDownHours
            NSLog("Going to SeventhViewController")
            
        } else {
            let destination : EigthViewController = segue.destination as! EigthViewController
            
            destination.usersName = String(usersName)
            destination.warmUpSeconds = warmUpSeconds
            destination.warmUpMinutes = warmUpMinutes
            destination.warmUpHours = warmUpHours
            destination.coolDownSeconds = coolDownSeconds
            destination.coolDownMinutes = coolDownMinutes
            destination.coolDownHours = coolDownHours
            NSLog("Going to EigthViewController")
        }
    }

    
    
}



