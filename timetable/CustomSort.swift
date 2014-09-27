//
//  CustomSort.swift
//  UBBTimeTable
//
//  Created by Victor Ursan on 9/13/14.
//  Copyright (c) 2014 Victor Ursan. All rights reserved.
//

import UIKit

class CustomSort: NSObject {
  let dayDictionary: [String : Int] = [ "Luni" : 0, "Marti" : 1, "Miercuri" : 2, "Joi" : 3, "Vineri" : 4 ]
  
  func sortSubjects(subjects: [Subject]) -> [Subject] {
    let result = sorted(subjects, { (s1: Subject, s2: Subject) -> Bool in
      if self.dayDictionary[s1.ziua] < self.dayDictionary[s2.ziua] {
        return true
      } else if self.dayDictionary[s1.ziua] == self.dayDictionary[s2.ziua] {
        let indexS1 = find(s1.orele, "-")!
        let indexS2 = find(s2.orele, "-")!
        if s1.orele.substringToIndex(indexS1).toInt()! < s2.orele.substringToIndex(indexS2).toInt()! {
          return true
        } else if s1.orele.substringToIndex(indexS1).toInt()! == s2.orele.substringToIndex(indexS2).toInt()! {
          return s1.formatia < s2.formatia
        }
        return false
      }
      return false
    })
    return result
  }
  
}
