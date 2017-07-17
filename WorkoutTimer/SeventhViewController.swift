//
//  SeventhViewController.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/14/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import Foundation
import UIKit

class SeventhViewController: UIViewController{
    
    @IBOutlet weak var seventhLabel: UILabel!
    
    
    
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
    
    
    
}
