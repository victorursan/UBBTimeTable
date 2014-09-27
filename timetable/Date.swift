//
//  Date.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 9/12/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

class Date: NSObject {
  
  let date = NSDate()
  let calendar = NSCalendar.currentCalendar()
  var components: NSDateComponents
  let translate: [String : String] = ["Monday" : "Luni", "Tuesday" : "Marti", "Wednesday" : "Miercuri", "Thursday" : "Joi", "Friday" : "Vineri", "Saturday" : "Luni", "Sunday" : "Luni"]
  
  override init() {
    components = calendar.components(NSCalendarUnit.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: date)
    super.init()
  }
  
  func yearInt() -> Int {
    return components.year
  }

  func monthInt() -> Int {
    return components.month
  }
  
  func dayInt() -> Int {
    return components.day
  }
  
  func dayString() -> String {
    let dateFormater = NSDateFormatter()
    dateFormater.dateFormat = "EEEE"
    return translate[dateFormater.stringFromDate(date)]!
  }
  
}
