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
    
    override func viewDidLoad() {
        self.nameEnter.delegate = self as? UITextFieldDelegate
        hiddenLabel.isHidden = true
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {// became first responder
        
        hiddenLabel.isHidden = false
        
    }
    
   /* func textFieldDidEndEditing(_ textField: UITextField){
        var name = String(nameEnter.text!)
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var DestViewController : ViewController = segue.destination as! ViewController
        
        DestViewController.toggleI = String(nameEnter.text!)
    }
    
}

