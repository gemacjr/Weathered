//
//  NSDate.swift
//  Weathered
//
//  Created by Ed McCormic on 8/13/17.
//  Copyright © 2017 Swiftbeard. All rights reserved.
//

import Foundation


/*
 y = year
 Q = quarter
 M = month
 w = week of year
 W = week of month
 d = day of month
 D = day of year
 E = day of week
 a = period (AM or PM)
 h = hour (1 - 12)
 H = hour (0 - 23)
 m = minute
 s = second
 
 */

extension Date {
    
    func dayOfTheWeek() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        //dateFormatter.dateFormat = "MMM/dd/yyyy"
        
        
        return dateFormatter.string(from: self)
    }
}
