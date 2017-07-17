//
//  SecondViewController.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/11/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var nameEnter: UITextField!
    @IBOutlet weak var hiddenLabel: UILabel!
    
    
    /* 
     * This section below reveals the instructions to "swipe to 
     * move on" once the user starts typing in the textfield
     */
    @IBAction func textChange(_ sender: UITextField) {
        hiddenLabel.isHidden = false
    }
    
    
    override func viewDidLoad() {
        self.nameEnter.delegate = self as? UITextFieldDelegate
        hiddenLabel.isHidden = true
        
        super.viewDidLoad()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func textFieldDidBeginEditing(_ textField: UITextField) {// became first responder
        hiddenLabel.isHidden = false
        
    }*/
    
   /* func textFieldDidEndEditing(_ textField: UITextField){
        var name = String(nameEnter.text!)
    }*/
    
    
    /*
     * This section below prepares for the transition to the next
     * controller, setting the "future" variable's value to the users name
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination : ViewController = segue.destination as! ViewController
        
        destination.usersName = String(nameEnter.text!)
    }
    
    /* 
     * This section below prevents the user from moving on if
     * they haven't entered their name yet
     */
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if nameEnter.text == ""{ //checks textfield to see if it's empty
            let alertController = UIAlertController(title: "Workout Timer", message:
                "Please enter your name", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            return false
        }
        return true
    }
    
}

