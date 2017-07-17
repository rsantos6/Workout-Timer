//
//  FourthController.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/14/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import Foundation
import UIKit

class FourthViewController: UIViewController,UITextFieldDelegate{
    

    
    
    var usersName = String()
    var warmUpSeconds = Int()
    var warmUpMinutes = Int()
    var warmUpHours = Int()
    var coolDownSeconds = Int()
    var coolDownMinutes = Int()
    var coolDownHours = Int()

    override func viewDidLoad() {
        NSLog("in class")
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination : FifthViewController = segue.destination as! FifthViewController
        NSLog("in segue")
        destination.usersName = String(usersName)
        destination.warmUpSeconds = warmUpSeconds
        destination.warmUpMinutes = warmUpMinutes
        destination.warmUpHours = warmUpHours
        destination.coolDownSeconds = coolDownSeconds
        destination.coolDownMinutes = coolDownMinutes
        destination.coolDownHours = coolDownHours
    }
      
    
}


