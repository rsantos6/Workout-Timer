//
//  IncrementDecrement.swift
//  WorkoutTimer
//
//  Created by Santos, Russell on 7/21/17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import Foundation

class IncrementDecrement {
    
    var startInterval: Int
    var endInterval: Int
    var intervalChangeHours: Int
    var intervalChangeMinutes: Int
    var intervalChangeSeconds: Int
    var restChangeHours: Int
    var restChangeMinutes: Int
    var restChangeSeconds: Int
    var incrementPickUp: Bool
    var decrementPickUp: Bool
    var incrementRest: Bool
    var decrementRest: Bool
    
    
    init (startInterval: Int, endInterval: Int, intervalChangeHours: Int,intervalChangeMinutes: Int, intervalChangeSeconds: Int, restChangeHours: Int,restChangeMinutes: Int, restChangeSeconds: Int, incrementPickUp: Bool, decrementPickUp: Bool, incrementRest: Bool, decrementRest: Bool) {
        self.startInterval = startInterval
        self.endInterval = endInterval
        self.intervalChangeHours = intervalChangeHours
        self.intervalChangeMinutes = intervalChangeMinutes
        self.intervalChangeSeconds = intervalChangeSeconds
        self.restChangeHours = restChangeHours
        self.restChangeMinutes = restChangeMinutes
        self.restChangeSeconds = restChangeSeconds
        self.incrementPickUp = incrementPickUp
        self.decrementPickUp = decrementPickUp
        self.incrementRest = incrementRest
        self.decrementRest = decrementRest
    }
    
    func getStartInterval() -> Int {
        return self.startInterval
    }
    
    func getEndInterval() -> Int {
        return self.endInterval
    }
    
    func getIntervalChangeHours() -> Int {
        return self.intervalChangeHours
    }
    
    func getIntervalChangeMinutes() -> Int {
        return self.intervalChangeMinutes
    }
    
    func getIntervalChangeSeconds() -> Int {
        return self.intervalChangeSeconds
    }
    
    func getRestChangeHours() -> Int {
        return self.restChangeHours
    }
    
    func getRestChangeMinutes() -> Int {
        return self.restChangeMinutes
    }
    
    func getRestChangeSeconds() -> Int {
        return self.restChangeSeconds
    }
    
    func isIncrementPickUp() -> Bool {
        return self.incrementPickUp
    }
    
    func isDecrementPickUp() -> Bool {
        return self.decrementPickUp
    }
    
    func isIncrementRest() -> Bool {
        return self.incrementRest
    }
    
    func isDecrementRest() -> Bool {
        return self.decrementRest
    }
    
    func isEqual(temp: IncrementDecrement) -> Bool {
        if
        ((self.startInterval == temp.getStartInterval()) &&
        (self.endInterval == temp.getEndInterval()) &&
        (self.intervalChangeHours == temp.getIntervalChangeHours()) &&
        (self.intervalChangeMinutes == temp.getIntervalChangeMinutes()) &&
        (self.intervalChangeSeconds == temp.getIntervalChangeSeconds()) &&
        (self.restChangeHours == temp.getRestChangeHours()) &&
        (self.restChangeMinutes == temp.getRestChangeMinutes()) &&
        (self.restChangeSeconds == temp.getRestChangeSeconds()) &&
        (self.incrementPickUp == temp.isIncrementPickUp()) &&
        (self.decrementPickUp == temp.isDecrementPickUp()) &&
        (self.incrementRest == temp.isIncrementRest()) &&
        (self.decrementRest == temp.isDecrementRest()))
        
        {
            return true
        } else {
            return false
        }
    }
    
    func intersectingIntervals(temp: IncrementDecrement) -> Bool {
        NSLog("My start: " + String(self.startInterval))
        NSLog("My end: " + String(self.endInterval))
        NSLog("Temps start: " + String(temp.getStartInterval()))
        NSLog("Temps end: " + String(temp.getEndInterval()))
        if (self.startInterval < temp.getEndInterval()) && (self.startInterval > temp.getStartInterval()) {
            return true
            
        } else if (self.endInterval < temp.getEndInterval()) && (self.endInterval > temp.getStartInterval()) {
            return true
            
        } else if (self.endInterval > temp.getEndInterval()) && (self.startInterval < temp.getStartInterval()) {
            return true
            
        } else {
            return false 
        }
    }
    
    func toString () {
        NSLog("startInterval: " + String(startInterval))
        NSLog("endInterval: " + String(endInterval))
        NSLog("intervalChangeHours: " + String(intervalChangeHours))
        NSLog("intervalChangeMinutes: " + String(intervalChangeMinutes))
        NSLog("intervalChangeSeconds: " + String(intervalChangeSeconds))
        NSLog("restChangeHours: " + String(restChangeHours))
        NSLog("restChangeMinutes: " + String(restChangeMinutes))
        NSLog("restChangeSeconds: " + String(restChangeSeconds))
        NSLog("incrementPickUp: " + String(incrementPickUp))
        NSLog("decrementPickUp: " + String(decrementPickUp))
        NSLog("incrementRest: " + String(incrementRest))
        NSLog("decrementRest: " + String(decrementRest))
    }
}







