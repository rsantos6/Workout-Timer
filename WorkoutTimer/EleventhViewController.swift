//
//  EleventhViewController.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/17/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class EleventhViewController: UIViewController {
    
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    var buglePlayed = false
    
    @IBOutlet weak var time: UILabel!
  
    @IBAction func startTimer(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(EleventhViewController.counter), userInfo: nil, repeats: true)
        if !buglePlayed {
            audioPlayer.play()
            buglePlayed = true
            let utterance = AVSpeechUtterance(string: "Begin workout! Good luck " + usersName + "!")
            utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
            utterance.rate = 0.5
            
            let synthesizer = AVSpeechSynthesizer()
            synthesizer.speak(utterance)
        }
        
    }
    
    @IBAction func stopTimer(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    func counter () {
        warmUpSeconds -= 1
        time.text = String(warmUpSeconds)
        
        if(warmUpSeconds == 0){
            timer.invalidate()
        }
    }
    
    
    
    
    
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
    
    override func viewDidLoad() {
     
        super.viewDidLoad()
        
          time.text = String(warmUpHours) + ":" + String(warmUpMinutes) + ":" + String(warmUpSeconds)
        
        do {
            //audio from www.audiomicro.com
            let audioPath = Bundle.main.path(forResource: "bugle", ofType: ".wav")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch {
            //ERROR
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

